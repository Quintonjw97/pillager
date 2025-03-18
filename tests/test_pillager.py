import pillager.pillager as pg
import pytest as pt
import numpy as np
import os

t_class = pg.Pillager()
t_class.output_dir= os.path.dirname(__file__) + '/util_data/'
def test_blacklist_dir_files(obj=t_class):
    obj.blacklist_dir_files()
    assert set(obj.file_blacklist).issubset([obj.input_base,obj.control_base,'serpent.i','serpent.i.wrk','outputs.csv','serpent.i_det0.m','serpent.i_res.m'])
    assert len(obj.file_blacklist) - 2 == len([obj.input_base,obj.control_base,'serpent.i','serpent.i.wrk','outputs.csv','serpent.i_det0.m','serpent.i_res.m'])
'''
def test_run_search(obj=t_class):
    assert True
'''
def test_regressive_secant(obj=t_class):
    ans = np.exp(0)
    y = [-1,1]
    f = [ans - np.exp(y[0]),ans - np.exp(y[1])]
    for i in range(5):
        val = obj.regressive_secant(y,f)
        y.append(val)
        f.append(ans - np.exp(y[-1]))
    assert pt.approx(np.exp(y[-1])) == ans

def test_generalized_regressive_secant(obj=t_class):
    ans = np.exp(0)
    y = [-1,1]
    sigs = [0.0001,0.0001]
    f = [ans - np.exp(y[0]),ans - np.exp(y[1])]
    for i in range(6):
        val = obj.generalized_regressive_secant(y,f,sigs)
        y.append(val)
        f.append(ans - np.exp(y[-1]))
        sigs.append(0.001)
    assert pt.approx(np.exp(y[-1])) == ans

def test_get_eigenvalue(obj=t_class):
    assert obj.get_eigenvalue() == ('9.99716E-01','0.00021')

def test_get_detector_values(obj=t_class):
    df = obj.get_detector_values('serpent.i_det0.m')
    assert df.shape == (1,516)
'''
def test_write_serpent(obj=t_class):
    assert True

def test_run_serpent(obj=t_class):
    assert True
'''
def test_move_files(obj=t_class):
    obj.move_files()
    files = os.listdir(obj.output_dir)
    assert 'day0' in files
    assert len(os.listdir(obj.output_dir + 'day0')) == 0
    os.rmdir(obj.output_dir + 'day0')
'''
def test_pillage(obj=t_class):
    assert True
'''