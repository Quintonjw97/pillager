![Tests](https://github.com/Quintonjw97/pillager/actions/workflows/run-tests.yml/badge.svg)
[![cov](https://quintonjw97.github.io/pillager/badges/coverage.svg)](https://github.com/quintonjw97/pillager/actions)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# Pillager

Pillager is a tool for coupling regressive and generalized regressive secant search methods with Serpent 2 transport code burnup calculations. These search methods are detailed in [Price and Roskoff (2023)](https://www.sciencedirect.com/science/article/abs/pii/S014919702300166X). Since the burnup of materials in a nuclear reactor is a function of the neutron flux, and flux is dependent upon material composition and geometry, it is important to conduct burnup calculations with a critical geometry. Criticality, in turn, changes with burnup, necessitating the use of such search methods. Pillager contains the aforementioned search methods, and the capability to automate the coupled process for a realistic Heat-Pipe Microreactor ([rHPMR](https://www.osti.gov/biblio/2367263)) design.

By providing a base Serpent input file for the reactor and a separate file containing the necessary geometry for the control surfaces, annotated with a variable 'x', Pillager will write the necessary additions for each burnup and search step. Inputs and results from each critical configuration are stored in a folder corresponding to the associated burnup step, and wholistic results are stored in a csv file.

<b>Note</b> the user must obtain access to Serpent 2 independently, it is not included in this package.

# [Documentation](https://quintonjw97.github.io/pillager/)
