
include ../common.mk

all: build

build: benchmarkintervalmove

benchmarkintervalmove.o: benchmarkintervalmove.cu 
	nvcc -gencode arch=compute_60,code=sm_70 -gencode arch=compute_35,code=sm_35 -I ../include -o $@ -c $<

mgpucontext.o: ../src/mgpucontext.cu
	nvcc -gencode arch=compute_60,code=sm_70 -gencode arch=compute_35,code=sm_35 -I ../include -o $@ -c $<

mgpuutil.o: ../src/mgpuutil.cpp
	nvcc -gencode arch=compute_60,code=sm_70 -gencode arch=compute_35,code=sm_35 -I ../include -o $@ -c $<

benchmarkintervalmove: benchmarkintervalmove.o mgpucontext.o mgpuutil.o
	nvcc -gencode arch=compute_60,code=sm_70 -gencode arch=compute_35,code=sm_35 -I ../include -o $@ $+

run: build
	./benchmarkintervalmove

clean:
	rm -f benchmarkintervalmove.o mgpucontext.o mgpuutil.o benchmarkintervalmove

clobber:
	clean

