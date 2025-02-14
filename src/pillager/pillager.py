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
        #self.file_blacklist = [self.input_base,self.control_base]

    def run_search(self,kwarg=['min','max'],kwarg_search='search'):
        """

        """
        thetas = self.xbounds
        self.write_serpent(thetas[0],self.particles,kwarg=kwarg[0])
        self.run_serpent()
        k_min, sdev = self.get_eigenvalue()
        fun = [float(k_min) - self.target]
        sigmas = [float(sdev)**2]
        
        self.write_serpent(thetas[1],self.particles,kwarg=kwarg[1])
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
                    self.write_serpent(thetas[-1],self.particles/10,kwarg=kwarg_search)
                else:
                    self.write_serpent(thetas[-1],self.particles,kwarg=kwarg_search)
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
                    self.write_serpent(thetas[-1],self.particles/10,kwarg=kwarg_search)
                else:
                    self.write_serpent(thetas[-1],self.particles,kwarg=kwarg_search)
                self.run_serpent()
                keff, sdev = self.get_eigenvalue()

                fun.append(float(keff) - self.target)
            k_crit = fun[-1] + self.target
            angle = thetas[-1]
        
        return k_max, k_min, k_crit, angle

    def regressive_secant(self,xs,fs):    # Updated to conform to class format
        """

        """
        R = self.retained_values
        if R >= len(fs):
            x_new = (np.sum(xs)*np.sum(np.multiply(fs,xs)) - np.sum(np.square(xs))*np.sum(fs)) / ((2+R)*np.sum(np.multiply(fs,xs)) - np.sum(fs)*np.sum(xs))
        else:
            x_new = (np.sum(xs[-R:])*np.sum(np.multiply(fs[-R:],xs[-R:])) - np.sum(np.square(xs[-R:]))*np.sum(fs[-R:])) / ((2+R)*np.sum(np.multiply(fs[-R:],xs[-R:])) - np.sum(fs[-R:])*np.sum(xs[-R:])) 
        return x_new

    def generalized_regressive_secant(self,xs,sigs,fs):  # Updated to conform to class format
        """

        """
        R = self.retained_values
        if R >= len(fs):
            x_new = (np.sum(np.divide(xs,sigs))*np.sum(np.divide(np.multiply(fs,xs),sigs)) - np.sum(np.divide(np.square(xs),sigs))*np.sum(np.divide(fs,sigs))) / (np.sum(np.divide(np.multiply(fs,xs),sigs))*np.sum(np.reciprocal(sigs)) - np.sum(np.divide(fs,sigs))*np.sum(np.divide(xs,sigs)))
        else:
            x_new = (np.sum(np.divide(xs[-R:],sigs[-R:]))*np.sum(np.divide(np.multiply(fs[-R:],xs[-R:]),sigs[-R:])) - np.sum(np.divide(np.square(xs[-R:]),sigs[-R:]))*np.sum(np.divide(fs[-R:],sigs[-R:]))) / (np.sum(np.divide(np.multiply(fs[-R:],xs[-R:]),sigs[-R:]))*np.sum(np.reciprocal(sigs[-R:])) - np.sum(np.divide(fs[-R:],sigs[-R:]))*np.sum(np.divide(xs[-R:],sigs[-R:]))) 
        return x_new

    def get_eigenvalue(self):   # Updated to conform to class format
        """

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
        
    def write_serpent(self,x,particles,kwarg,step=0):   # Updated to conform to class format
        """

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
            if kwarg == 'initial':
                pass
            elif kwarg == 'initialBurn':
                n.write('set mcvol 10000000 \n')
                n.write('set rfw 1 \n')
                n.write('set depout 3 \n')
                n.write('set printm 1 \n')
                n.write(f'dep {self.burnup_type} \n')
                n.write(f' {step} \n')
            elif kwarg == 'burn':
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

        """
        cmd = ['sss2', 'serpent.i', '-omp', str(self.nOMP)]
        subprocess.run(cmd,shell=False)
        return

    def move_files(self):
        """

        """
        pass

    def pillage(self):
        """

        """
        pass

data_storage = pd.DataFrame.from_dict({'Day':[],'Configuration':[],'keff':[],'CD Angle':[]})
# %%
# Functionality Test

problem = Pillager()
problem.input_base = 'serpent.i'
df = problem.get_detector_values('serpent.i_det0.m')
print(df)
'''
days = [0.5,1,31,61,91,121,151,181,211,241,271,301,331,365,395,425,455,485,500,501]

k_max, k_min, k_crit, angle = crit_search(kwarg=['initial','initial'],kwarg_search='initial')

os.makedirs('day0',exist_ok=True)
contents = os.listdir()
for name in contents:
    if ('.png' in name) and ('bstep0' not in name):
        os.rename(name,'day0/'+name)
os.rename('serpent.i','day0/serpent.i')
os.rename('serpent.i_res.m','day0/serpent.i_res.m')
entry = pd.DataFrame.from_dict({'Day':[0],'Configuration':['Critical'],'keff':[k_crit],'CD Angle':[angle]})
entry = pd.concat([entry,power_grab('serpent.i_det0.m')],axis=1)
entry = pd.concat([entry,pd.DataFrame.from_dict({'Day':[0,0],'Configuration':['In','Out'],'keff':[k_min,k_max],'CD Angle':[0,180]})],ignore_index=True)
os.rename('serpent.i_det0.m','day0/serpent.i_det0.m')
data_storage = pd.concat([data_storage,entry],ignore_index=True)
data_storage.to_csv('burnup_eigenvalues.csv',index=False)


# Conduct initial burn

write_serpent(angle,100000,kwarg='initialBurn',day=days[0])
run_serpent()

# Iterate Max, Min, Search, Burn

for i in range(len(days)-1):

    k_max, k_min, k_crit, angle = crit_search()
    
    os.makedirs('day'+str(days[i]),exist_ok=True)
    contents = os.listdir()
    for name in contents:
        if ('.png' in name) and ('bstep0' not in name):
            os.rename(name,'day'+str(days[i])+'/'+name)
    os.rename('serpent.i','day'+str(days[i])+'/serpent.i')
    os.rename('serpent.i_res.m','day'+str(days[i])+'/serpent.i_res.m')
    entry = pd.DataFrame.from_dict({'Day':[days[i]],'Configuration':['Critical'],'keff':[k_crit],'CD Angle':[angle]})
    entry = pd.concat([entry,power_grab('serpent.i_det1.m')],axis=1)
    entry = pd.concat([entry,pd.DataFrame.from_dict({'Day':[days[i],days[i]],'Configuration':['In','Out'],'keff':[k_min,k_max],'CD Angle':[0,180]})],ignore_index=True)
    os.rename('serpent.i_det1.m','day'+str(days[i])+'/serpent.i_det1.m')
    data_storage = pd.concat([data_storage,entry],ignore_index=True)
    data_storage.to_csv('burnup_eigenvalues.csv',index=False)

    write_serpent(angle,100000,kwarg='burn',day=days[i+1])
    run_serpent()
    
k_max, k_min, k_crit, angle = crit_search()
    
os.makedirs('day'+str(days[-1]),exist_ok=True)
contents = os.listdir()
for name in contents:
    if ('.png' in name) and ('bstep0' not in name):
        os.rename(name,'day'+str(days[-1])+'/'+name)
os.rename('serpent.i','day'+str(days[-1])+'/serpent.i')
os.rename('serpent.i_res.m','day'+str(days[-1])+'/serpent.i_res.m')
os.rename('serpent.i_geom1.png','day'+str(days[-1])+'/serpent.i_geom1.png')
entry = pd.DataFrame.from_dict({'Day':[days[-1]],'Configuration':['Critical'],'keff':[k_crit],'CD Angle':[angle]})
entry = pd.concat([entry,power_grab('serpent.i_det1.m')],axis=1)
entry = pd.concat([entry,pd.DataFrame.from_dict({'Day':[days[-1],days[-1]],'Configuration':['In','Out'],'keff':[k_min,k_max],'CD Angle':[0,180]})],ignore_index=True)
os.rename('serpent.i_det1.m','day'+str(days[-1])+'/serpent.i_det1.m')
data_storage = pd.concat([data_storage,entry],ignore_index=True)
data_storage.to_csv('burnup_eigenvalues.csv',index=False)
'''
