# grpc-examples

Build the gRPC image from the Dockerfile:

```bash
docker build -t grpc .
```

Run the server:

```bash
docker run -it --rm -d -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD grpc python3 helloworld/greeter_server.py
```

Use the `<docker_id>` that was printed to the screen and run the client:

```bash
docker exec <docker_id> python3 helloworld/greeter_client.py
```

Use the following to re-compile the Python protobuff code if necessary:

```bash
docker run -d -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD grpc \
  python3 -m grpc_tools.protoc -I . \
  --python_out=helloworld --grpc_python_out=helloworld helloworld.proto
```
