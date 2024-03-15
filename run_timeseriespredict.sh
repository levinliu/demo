#!/bin/sh
set -x
cd D:/PycharmProjects/ai-ops
rm -f ./venv/Lib/site-packages/AIops_tools-0.0.5-py3.10.egg
source venv/Scripts/activate &&\
 echo 1 || pip install --upgrade pip &&\
 #ModuleNotFoundError: No module named 'structure'
 #pip3 install pybrain==0.3.3 &&\
 cd aiopstools-master &&\
 export SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True &&\
 pip install tensorflow==1.14.0 &&\
 pip install protobuf==3.20.* &&\
 #echo 1 && pip install -r ../requirements.txt --cert=C:/ProgramData/anaconda3/Lib/site-packages/certifi/cacert.pem &&\
 # python setup.py install &&\
 python examples/ts_predict.py --model_name=ann --data_dir='./aiopstools/timeseries_predict/data/data.csv' --predict_time=24
#+ python examples/ts_predict.py --model_name=ann --data_dir=./aiopstools/timeseries_predict/data/data.csv --predict_time=24
 #Traceback (most recent call last):
 #  File "examples/ts_predict.py", line 9, in <module>
 #    from aiopstools.timeseries_predict import models
 #  File "<frozen importlib._bootstrap>", line 983, in _find_and_load
 #  File "<frozen importlib._bootstrap>", line 967, in _find_and_load_unlocked
 #  File "<frozen importlib._bootstrap>", line 668, in _load_unlocked
 #  File "<frozen importlib._bootstrap>", line 638, in _load_backward_compatible
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\aiops_tools-0.0.5-py3.7.egg\aiopstools\timeseries_predict\models\__init__.py", line 6, in <modu
 #le>
 #  File "<frozen importlib._bootstrap>", line 983, in _find_and_load
 #  File "<frozen importlib._bootstrap>", line 967, in _find_and_load_unlocked
 #  File "<frozen importlib._bootstrap>", line 668, in _load_unlocked
 #  File "<frozen importlib._bootstrap>", line 638, in _load_backward_compatible
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\aiops_tools-0.0.5-py3.7.egg\aiopstools\timeseries_predict\models\lstm.py", line 6, in <module>
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\tensorflow\__init__.py", line 28, in <module>
 #    from tensorflow.python import pywrap_tensorflow  # pylint: disable=unused-import
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\tensorflow\python\__init__.py", line 52, in <module>
 #    from tensorflow.core.framework.graph_pb2 import *
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\tensorflow\core\framework\graph_pb2.py", line 16, in <module>
 #    from tensorflow.core.framework import node_def_pb2 as tensorflow_dot_core_dot_framework_dot_node__def__pb2
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\tensorflow\core\framework\node_def_pb2.py", line 16, in <module>
 #    from tensorflow.core.framework import attr_value_pb2 as tensorflow_dot_core_dot_framework_dot_attr__value__pb2
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\tensorflow\core\framework\attr_value_pb2.py", line 16, in <module>
 #    from tensorflow.core.framework import tensor_pb2 as tensorflow_dot_core_dot_framework_dot_tensor__pb2
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\tensorflow\core\framework\tensor_pb2.py", line 16, in <module>
 #    from tensorflow.core.framework import resource_handle_pb2 as tensorflow_dot_core_dot_framework_dot_resource__handle__pb2
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\tensorflow\core\framework\resource_handle_pb2.py", line 42, in <module>
 #    serialized_options=None, file=DESCRIPTOR),
 #  File "D:\PycharmProjects\ai-ops\venv\lib\site-packages\google\protobuf\descriptor.py", line 561, in __new__
 #    _message.Message._CheckCalledFromGeneratedFile()
 #TypeError: Descriptors cannot not be created directly.
 #If this call came from a _pb2.py file, your generated code is out of date and must be regenerated with protoc >= 3.19.0.
 #If you cannot immediately regenerate your protos, some other possible workarounds are:
 # 1. Downgrade the protobuf package to 3.20.x or lower.
 # 2. Set PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python (but this will use pure-Python parsing and will be much slower).
 #
 #More information: https://developers.google.com/protocol-buffers/docs/news/2022-05-06#python-updates