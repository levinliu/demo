#!/bin/sh
#set -x


rm D:/PycharmProjects/ai-ops/venv/Lib/site-packages/PyBrain-0.3.1-py3.10.egg
cd D:/PycharmProjects/ai-ops
source venv/Scripts/activate &&\
  cd pybrain-0.3.3/pybrain-0.3.3 &&\
  python setup.py install
# from scipy.linalq import inv,det, svd, logm, expm2
# ImportError: cannot import name expm2
# ImportError: cannot import name 'random' from 'scipy' (D:\PycharmProjects\ai-ops\venv\lib\site-packages\scipy\__init__.py)
# https://stackoverflow.com/questions/73553533/why-do-i-get-an-error-with-from-scipy-import-random