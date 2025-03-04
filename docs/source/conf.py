# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

import os
import sys
sys.path.insert(0, os.path.abspath('../../src'))  # Source code dir relative to this file


project = 'pillager'
copyright = '2025, Quinton J. Williams'
author = 'Quinton J. Williams'
release = '0.0.2'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ['myst_parser','sphinx.ext.autodoc','sphinx.ext.napoleon','sphinx.ext.githubpages']
napoleon_numpy_docstring = True
napoleon_google_docstring = False
templates_path = ['_templates']
exclude_patterns = []
autodoc_default_options = {'members': True}
autoclass_content = 'class'

intersphinx_mapping = {
  'python': ('https://docs.python.org/3.11', None),
  'pandas': ('http://pandas.pydata.org/pandas-docs/stable/', None),
  'numpy': ('https://docs.scipy.org/doc/numpy/', None),
}

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'
html_static_path = ['_static']
