FROM nvcr.io/nvidia/cuda:9.2-devel
RUN apt update
RUN apt install -y numactl
RUN apt install -y wget
RUN wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.1.tar.gz
RUN gunzip openmpi-3.1.1.tar.gz
RUN tar -xvf openmpi-3.1.1.tar
RUN cd openmpi-3.1.1
RUN apt install -y cmake
RUN ./configure
RUN make all
