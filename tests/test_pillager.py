import pillager.pillager as pg
import pytest

t_class = pg.Pillager()

def test_blacklist_dir_files(obj=t_class):
    obj.blacklist_dir_files()
    assert True

def test_run_search(obj=t_class):
    assert True

def test_regressive_secant(obj=t_class):
    assert True

def test_generalized_regressive_secant(obj=t_class):
    assert True

def test_get_eigenvalue(obj=t_class):
    assert True

def test_get_detector_values(obj=t_class):
    assert True

def test_write_serpent(obj=t_class):
    assert True

def test_run_serpent(obj=t_class):
    assert True

def test_move_files(obj=t_class):
    assert True

def test_pillage(obj=t_class):
    assert True
