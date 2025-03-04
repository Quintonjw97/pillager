# %%
import numpy as np
import os
import subprocess
import pandas as pd
import csv

# %%
class Pillager():
    """ 
    Class for conducting coupled criticality search-burnup calculations in the Serpent 2 radiation transport code. 

    Individual functions can also be used to conduct variable search using secant, regressive secant, or generalized 
    regressive secant methods.

    """
    def __init__(self):
        self.output_dir = './'
        self.input_base = 'serpent_base.i'
        self.control_base = 'control.i'
        self.particles = 1e5
        self.generations = 160
        self.skipped_gens = 40
        self.target = 1
        self.retained_values = 2
        self.err_tol = 1e-5
        self.var_tol = 1
        self.burnup_steps = [0.1,0.5,1]
        self.burnup_type = 'daytot'
        self.xbounds = [0,180]
        self.function = 'Serpent'
        self.generalized_search = True
        self.nOMP = 48
        self.silent = True
        #self.x0 = None
        #self.y0 = None
        #self.sigma0 = None
        #self.move_files = True
        self.file_blacklist = [self.input_base,self.control_base,'serpent.i.wrk']

    def blacklist_dir_files(self):
        """
        Designates current directory files as blacklisted from movement.
        """
        return self.file_blacklist.append(os.listdir(self.output_dir))

    def run_search(self,config):    # Updated to conform to class format
        """
        Conducts criticality search.
        """
        thetas = self.xbounds
        self.write_serpent(thetas[0],self.particles,config=config)
        self.run_serpent()
        k_min, sdev = self.get_eigenvalue()
        fun = [float(k_min) - self.target]
        sigmas = [float(sdev)**2]
        
        self.write_serpent(thetas[1],self.particles,config=config)
        self.run_serpent()
        k_max, sdev = self.get_eigenvalue()
        fun.append(float(k_max) - self.target)
        sigmas.append(float(sdev)**2)

        iteration = 0
        if self.generalized_search:
            while (abs(fun[-1]) > self.err_tol or abs(thetas[-1] - thetas[-2]) > self.var_tol) and iteration < 6:
                iteration += 1

                thetas.append(self.generalized_regressive_secant(thetas,sigmas,fun))
                if iteration < 4:
                    self.write_serpent(thetas[-1],self.particles/10,config=config)
                else:
                    self.write_serpent(thetas[-1],self.particles,config=config)
                self.run_serpent()
                keff, sdev = self.get_eigenvalue()

                fun.append(float(keff) - self.target)
                sigmas.append(float(sdev)**2)
            k_crit = fun[-1] + self.target
            angle = thetas[-1]
        else:
            while (abs(fun[-1]) > self.err_tol or abs(thetas[-1] - thetas[-2]) > self.var_tol) and iteration < 6:
                iteration += 1

                thetas.append(self.regressive_secant(thetas,fun))
                if iteration < 4:
                    self.write_serpent(thetas[-1],self.particles/10,config=config)
                else:
                    self.write_serpent(thetas[-1],self.particles,config=config)
                self.run_serpent()
                keff, sdev = self.get_eigenvalue()

                fun.append(float(keff) - self.target)
            k_crit = fun[-1] + self.target
            angle = thetas[-1]
        
        return [k_max, k_min, k_crit, angle]

    def regressive_secant(self,xs,fs):    # Updated to conform to class format
        """
        Conducts a regressive secant evaluation to find next input value.
        """
        R = self.retained_values
        if R >= len(fs):
            x_new = (np.sum(xs)*np.sum(np.multiply(fs,xs)) - np.sum(np.square(xs))*np.sum(fs)) / ((2+R)*np.sum(np.multiply(fs,xs)) - np.sum(fs)*np.sum(xs))
        else:
            x_new = (np.sum(xs[-R:])*np.sum(np.multiply(fs[-R:],xs[-R:])) - np.sum(np.square(xs[-R:]))*np.sum(fs[-R:])) / ((2+R)*np.sum(np.multiply(fs[-R:],xs[-R:])) - np.sum(fs[-R:])*np.sum(xs[-R:])) 
        return x_new

    def generalized_regressive_secant(self,xs,sigs,fs):  # Updated to conform to class format
        """
        Conducts a generalized regressive secant evaluation to find next input value.
        """
        R = self.retained_values
        if R >= len(fs):
            x_new = (np.sum(np.divide(xs,sigs))*np.sum(np.divide(np.multiply(fs,xs),sigs)) - np.sum(np.divide(np.square(xs),sigs))*np.sum(np.divide(fs,sigs))) / (np.sum(np.divide(np.multiply(fs,xs),sigs))*np.sum(np.reciprocal(sigs)) - np.sum(np.divide(fs,sigs))*np.sum(np.divide(xs,sigs)))
        else:
            x_new = (np.sum(np.divide(xs[-R:],sigs[-R:]))*np.sum(np.divide(np.multiply(fs[-R:],xs[-R:]),sigs[-R:])) - np.sum(np.divide(np.square(xs[-R:]),sigs[-R:]))*np.sum(np.divide(fs[-R:],sigs[-R:]))) / (np.sum(np.divide(np.multiply(fs[-R:],xs[-R:]),sigs[-R:]))*np.sum(np.reciprocal(sigs[-R:])) - np.sum(np.divide(fs[-R:],sigs[-R:]))*np.sum(np.divide(xs[-R:],sigs[-R:]))) 
        return x_new

    def get_eigenvalue(self):   # Updated to conform to class format
        """
        Gets implicit eigenvalue from Serpent results output file.
        """
        file = open(self.output_dir+'serpent.i_res.m')
        data = file.readlines()
        file.close()
        for line in data:
            if "IMP_KEFF" in line:
                #Gather the keff and uncertainty values for each day 
                all = line.split()
                keff = all[-3]
                sdev = all[-2]
        return keff, sdev

    def get_detector_values(self,file_name):
        """
        Gets detector values from Serpent simulation detector output file.
        """
        #Open the file, read it, and close it
        file = open(self.output_dir + file_name)
        data = file.readlines()

        file.close()
        power = False
        valsPower = []
        mono = False
        monoDict = dict()
        radial = False
        radialDict = dict()
        excore = False
        excoreDict = dict()

        #Look for the applicable data
        for line in data:
            #Gathers the excore detector data
            if "DETex_core_det" in line and excore == False:
                excore = True
                dataType = line
                excoreDetID = ''.join(filter(lambda i: i.isdigit(), line)) 
                if not(excoreDetID in excoreDict.keys()):    
                    excoreDict[excoreDetID] =  dict()
                excoreKey = ''
                excoreFluxVals = []
                excoreZVals = []
            #Gathers the monolith detector data 
            elif excore == True and  not("];" in line):
                #Gathers the correct information if it is the monolith detector flux section
                if "det = [" in dataType:
                    excoreKey = 'Flux'
                    all = line.split()
                    excoreFluxVals.append(all[-2:])
                #Gathers the correct information if it is the monolith detector Z location section
                elif "detZ = [" in dataType:
                    excoreKey = 'Z'
                    all = line.split()
                    excoreZVals.append(all[:2])
            elif "];" in line and excore == True:
                excore = False
                if excoreKey == 'Flux':
                    excoreDict[excoreDetID][excoreKey] = excoreFluxVals
                elif excoreKey == 'Z':
                    excoreDict[excoreDetID][excoreKey] = excoreZVals 

            #Gathers the inner core detector data
            if "DETinner_radial_det" in line and radial == False:
                radial = True
                dataType = line
                radialDetID = ''.join(filter(lambda i: i.isdigit(), line)) 
                if not(radialDetID in radialDict.keys()):    
                    radialDict[radialDetID] =  dict()
                radialKey = ''
                radialFluxVals = []
                radialZVals = []
            #Gathers the reflector detector data 
            elif radial == True and  not("];" in line):
                #Gathers the correct information if it is the reflector detector flux section
                if "det = [" in dataType:
                    radialKey = 'Flux'
                    all = line.split()
                    radialFluxVals.append(all[-2:])
                #Gathers the correct information if it is the reflector detector Z location section
                elif "detZ = [" in dataType:
                    radialKey = 'Z'
                    all = line.split()
                    radialZVals.append(all[:2])
            elif "];" in line and radial == True:
                radial = False
                if radialKey == 'Flux':
                    radialDict[radialDetID][radialKey] = radialFluxVals
                elif radialKey == 'Z':
                    radialDict[radialDetID][radialKey] = radialZVals    
                    
            #Gathers the monolith core detector data
            if "DETmonolith_det" in line and mono == False:
                mono = True
                dataType = line
                monoDetID = ''.join(filter(lambda i: i.isdigit(), line)) 
                if not(monoDetID in monoDict.keys()):    
                    monoDict[monoDetID] =  dict()
                monoKey = ''
                monoFluxVals = []
                monoZVals = []
            #Gathers the reflector detector data 
            elif mono == True and  not("];" in line):
                #Gathers the correct information if it is the reflector detector flux section
                if "det = [" in dataType:
                    monoKey = 'Flux'
                    all = line.split()
                    monoFluxVals.append(all[-2:])
                #Gathers the correct information if it is the reflector detector Z location section
                elif "detZ = [" in dataType:
                    monoKey = 'Z'
                    all = line.split()
                    monoZVals.append(all[:2])
            elif "];" in line and mono == True:
                mono = False
                if monoKey == 'Flux':
                    monoDict[monoDetID][monoKey] = monoFluxVals
                elif monoKey == 'Z':
                    monoDict[monoDetID][monoKey] = monoZVals   
        
            #Gathers the assembly power data
            if "DETpower" in line and power == False:
                power = True
            #Read the assembly number, power, and standard deviation
            elif power == True and not("];" in line):
                all = line.split()
                wanted = []
                wanted.append(all[0])
                wanted.append(all[-2])
                wanted.append(all[-1])
                valsPower.append(wanted)
            elif "];" in line and power == True:
                power = False
                    
        #Write the monolith detector values for that day to a CSV file
        with open("flux_dat.csv", "w+", newline='') as csvfile:
            writer = csv.writer(csvfile)
            res = []
            labels = []
            for key in monoDict:
                ax = 1
                for rowFlux in monoDict[key]['Flux']:
                    labels.append("monolith_det_" + str(key) + "_a" + str(ax) + "_Flux")
                    labels.append("monolith_det_" + str(key) + "_a" + str(ax) + "_Uncertainty")
                    res.append(rowFlux[0])
                    res.append(rowFlux[1])
                    ax = ax + 1
            for key in radialDict:
                ax = 1
                for rowFlux in radialDict[key]['Flux']:
                    labels.append("radial_det_" + str(key) + "_a" + str(ax) + "_Flux")
                    labels.append("radial_det_" + str(key) + "_a" + str(ax) + "_Uncertainty")
                    res.append(rowFlux[0])
                    res.append(rowFlux[1])
                    ax = ax + 1
            for key in excoreDict:
                ax = 1
                for rowFlux in excoreDict[key]['Flux']:
                    labels.append("excore_det_" + str(key) + "_a" + str(ax) + "_Flux")
                    labels.append("excore_det_" + str(key) + "_a" + str(ax) + "_Uncertainty")
                    res.append(rowFlux[0])
                    res.append(rowFlux[1])
                    ax = ax + 1
            k = 0
            for i in range(0, len(valsPower)):
                if not(valsPower[i][1] == '0.00000E+00' and valsPower[i][2] == '0.00000'): 
                    labels.append("assembly_" + str(valsPower[i][0]) + "_Power")
                    labels.append("assembly_" + str(valsPower[i][0]) + "_Uncertainty")
                    res.append(valsPower[i][1])
                    res.append(valsPower[i][2])
                    k += 1
            writer.writerow(labels)
            writer.writerow(res)
        df = pd.read_csv('flux_dat.csv',delimiter=',',)
        os.remove('flux_dat.csv')
        return df
        
    def write_serpent(self,x,particles,config,step=0):   # Updated to conform to class format
        """
        Writes serpent input files.
        """
        with open(self.input_base,'r', encoding='utf-8') as f:
            with open('serpent.i','w', encoding='utf-8') as n:
                for line in f:
                    n.write(line)
                n.write(f'\n set pop {particles} {self.generations} {self.skipped_gens} \n')
                n.write('set bc 1 \n')
                n.write('set opti 3 \n')
                n.write('set nbuf 100 \n')
                n.write('set memfrac 0.9 \n')
                n.write(f'surf 94 pad 0.0 0.0 14.0 15.0 {300.0+180-x} {60.0+180-x} \n')
                n.write(f'surf 95 pad 0.0 0.0 14.0 15.0 {240.0+180-x} {0.0+180-x} \n')
                n.write(f'surf 96 pad 0.0 0.0 14.0 15.0 {240.0+180-x} {0.0+180-x} \n')
                n.write(f'surf 97 pad 0.0 0.0 14.0 15.0 {180.0+180-x} {-60.0+180-x} \n')
                n.write(f'surf 98 pad 0.0 0.0 14.0 15.0 {180.0+180-x} {-60.0+180-x} \n')
                n.write(f'surf 99 pad 0.0 0.0 14.0 15.0 {120.0+180-x} {-120.0+180-x} \n')
                n.write(f'surf 100 pad 0.0 0.0 14.0 15.0 {120.0+180-x} {-120.0+180-x} \n')
                n.write(f'surf 101 pad 0.0 0.0 14.0 15.0 {60.0+180-x} {-180.0+180-x} \n')
                n.write(f'surf 102 pad 0.0 0.0 14.0 15.0 {60.0+180-x} {-180.0+180-x} \n')
                n.write(f'surf 103 pad 0.0 0.0 14.0 15.0 {0.0+180-x} {-240.0+180-x} \n')
                n.write(f'surf 104 pad 0.0 0.0 14.0 15.0 {0.0+180-x} {-240.0+180-x} \n')
                n.write(f'surf 105 pad 0.0 0.0 14.0 15.0 {300.0+180-x} {60.0+180-x} \n')
        with open('serpent.i','a', encoding='utf-8') as n:
            if config == 'initial':
                pass
            elif config == 'initialBurn':
                n.write('set mcvol 10000000 \n')
                n.write('set rfw 1 \n')
                n.write('set depout 3 \n')
                n.write('set printm 1 \n')
                n.write(f'dep {self.burnup_type} \n')
                n.write(f' {step} \n')
            elif config == 'burn':
                n.write('set mcvol 10000000 \n')
                n.write('set rfw 1 \n')
                n.write('set rfr continue \"serpent.i.wrk\" \n')
                n.write('set depout 3 \n')
                n.write('set printm 1 \n')
                n.write(f'dep {self.burnup_type} \n')
                n.write(f' {step} \n')
            else:
                n.write('set rfr continue \"serpent.i.wrk\" \n')

    def run_serpent(self):  # Updated to conform to class format
        """
        Runs the generated serpent input file.
        """
        cmd = ['sss2', 'serpent.i', '-omp', str(self.nOMP)]
        subprocess.run(cmd,shell=False)
        return

    def move_files(self,step=0):
        """
        Moves generated input and output files for a given timestep.
        """
        os.makedirs(f'day{step}',exist_ok=True)
        contents = os.listdir(self.output_dir)
        for name in contents:
            if name not in self.file_blacklist:
                os.rename(name,f'day{step}/{name}')
        return

    def pillage(self):
        """
        Conducts a full coupled criticality search-burnup calculation over the designated burnup steps.
        """
        data_storage = pd.DataFrame.from_dict({'Day':[],'k_max':[],'k_min':[],'k_crit':[],'CD Angle':[]})
        eigenvalues = self.run_search('initial')
        entry = pd.DataFrame.from_dict({'Day':[0],'k_max':[eigenvalues[0]],'k_min':[eigenvalues[1]],'k_crit':[eigenvalues[2]],'CD Angle':[eigenvalues[3]]})
        entry = pd.concat([entry,self.get_detector_values('serpent.i_det0.m')],axis=1)
        data_storage = pd.concat([data_storage,entry],ignore_index=True)
        data_storage.to_csv('outputs.csv',index=False)
        self.move_files()
        self.write_serpent(eigenvalues[-1],self.particles,'initialBurn',step=self.burnup_steps[0])
        self.run_serpent()
        for i in range(len(self.burnup_steps)-1):
            eigenvalues = self.run_search('')
            entry = pd.DataFrame.from_dict({'Day':[self.burnup_steps[i]],'k_max':[eigenvalues[0]],'k_min':[eigenvalues[1]],'k_crit':[eigenvalues[2]],'CD Angle':[eigenvalues[3]]})
            entry = pd.concat([entry,self.get_detector_values('serpent.i_det1.m')],axis=1)
            data_storage = pd.concat([data_storage,entry],ignore_index=True)
            data_storage.to_csv('outputs.csv',index=False)
            self.move_files()
            self.write_serpent(eigenvalues[-1],self.particles,'burn',step=self.burnup_steps[i+1])
            self.run_serpent()
        eigenvalues = self.run_search('')
        entry = pd.DataFrame.from_dict({'Day':[self.burnup_steps[-1]],'k_max':[eigenvalues[0]],'k_min':[eigenvalues[1]],'k_crit':[eigenvalues[2]],'CD Angle':[eigenvalues[3]]})
        entry = pd.concat([entry,self.get_detector_values('serpent.i_det1.m')],axis=1)
        data_storage = pd.concat([data_storage,entry],ignore_index=True)
        data_storage.to_csv('outputs.csv',index=False)
        self.move_files()
        return

data_storage = pd.DataFrame.from_dict({'Day':[],'Configuration':[],'keff':[],'CD Angle':[]})
# %%
# Functionality Test

problem = Pillager()
problem.input_base = 'serpent.i'
df = problem.get_detector_values('serpent.i_det0.m')
print(df)
