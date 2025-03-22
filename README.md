![Tests](https://github.com/Quintonjw97/pillager/actions/workflows/run-tests.yml/badge.svg)
[![cov](https://quintonjw97.github.io/pillager/badges/coverage.svg)](https://github.com/quintonjw97/pillager/actions)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# Pillager

Pillager is a tool for coupling regressive and generalized regressive secant search methods with Serpent 2 transport code burnup calculations. These search methods are detailed in [Price and Roskoff (2023)](https://www.sciencedirect.com/science/article/abs/pii/S014919702300166X). Since the burnup of materials in a nuclear reactor is a function of the neutron flux, and flux is dependent upon material composition and geometry, it is important to conduct burnup calculations with a critical geometry. Criticality, in turn, changes with burnup, necessitating the use of such search methods. Pillager contains the aforementioned search methods, and the capability to automate the coupled process for a realistic Heat-Pipe Microreactor ([rHPMR](https://www.osti.gov/biblio/2367263)) design.

By providing a base Serpent input file for the reactor and a separate file containing the necessary geometry for the control surfaces, annotated with a variable 'x', Pillager will write the necessary additions for each burnup and search step. Inputs and results from each critical configuration are stored in a folder corresponding to the associated burnup step, and wholistic results are stored in a csv file.

<b>Note</b> the user must obtain access to Serpent 2 independently, it is not included in this package.

## Installation 

To install, clone this repository and pip install as follows:
```
git clone https://github.com/Quintonjw97/pillager.git
pip install .
```

## [Documentation](https://quintonjw97.github.io/pillager/)

## Example Criticality Search-Burnup Problem

The Pillager class contains various functions that are used to automatically conduct the coupled search-burnup task. Below is an example of a basic coupled criticality search-burnup script.
```
import pillager.pillager as pg

problem = pg.Pillager()
problem.blacklist_dir_files()
problem.pillage()
```
An instance of the Pillager class is created first, then the blacklist_dir_files() function should be called to prevent any files in the working directory from being moved, as the pillage() function will move generated Serpent inputs and outputs into folders corresponding to their burnup step. The code above will use the default settings for various Serpent input parameters, though the user can manually designate some values (see documentation).
