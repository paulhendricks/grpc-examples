FROM ubuntu:latest

# ========== Install packages ==========
RUN apt-get update && apt-get install -y build-essential git libjpeg-dev python3 python3-pip
RUN pip3 install grpcio grpcio-tools
CMD ["bash"]
