#!/usr/bin/env bash

docker build -t grpc .
docker run -it -v $PWD:$PWD grpc
docker run -it -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD grpc

cd Users/paulhendricks/projects/grpc-examples/helloworld

docker run -it --rm -u $(id -u):$(id -g) -p 50051:50051 -v $PWD:$PWD -w $PWD grpc
docker run -it --rm -d -u $(id -u):$(id -g) -p 50051:50051 -v $PWD:$PWD -w $PWD grpc python3 helloworld/greeter_server.py
docker exec 814 python3 helloworld/greeter_client.py

# compile protobuff to python code
docker run -d -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD grpc \
  python3 -m grpc_tools.protoc -I . \
  --python_out=helloworld --grpc_python_out=helloworld helloworld.proto
