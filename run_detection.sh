#!/bin/sh
set -x
cd D:/PycharmProjects/ai-ops
rm -f ./venv/Lib/site-packages/AIops_tools-0.0.4-py3.10.egg
source venv/Scripts/activate &&\
 echo 1 || pip install --upgrade pip &&\
 cd aiopstools-master &&\
 export SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True &&\
 echo 1 && pip install -r ../requirements.txt --cert=C:/ProgramData/anaconda3/Lib/site-packages/certifi/cacert.pem &&\
  python setup.py install &&\
 python examples/detection.py --data_dir=./aiopstools/anomaly_detection/data/data.csv --period_freq='D' --voting_num=3