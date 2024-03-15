#!/bin/sh
#set -x

cd D:/PycharmProjects/ai-ops
rm -f ./venv/Lib/site-packages/AIops_tools-0.0.4-py3.10.egg
source venv/Scripts/activate &&\
 echo 1 || pip install --upgrade pip &&\
 cd aiopstools-master &&\
 export SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True &&\
 echo 1 && pip install -r ../requirements.txt --cert=C:/ProgramData/anaconda3/Lib/site-packages/certifi/cacert.pem &&\
  python setup.py install &&\
 python examples/alarm_convergence.py --data_dir=./aiopstools/association_analysis/data/alarm.txt --minsupport=0.2 --minconf=0.2


cd D:/PycharmProjects/ai-ops
 source venv/Scripts/activate &&\
 cd aiopstools-master &&\
 python examples/alarm_convergence.py --data_dir=./aiopstools/association_analysis/data/alarm.txt --minsupport=0.2 --minconf=0.5