INC_PATH = -I. -I/opt/rocm/hip/include -I./include -I/opt/rocm/rocblas/include
LIB_PATH = -L./lib -lcheckresult -lsgemm_strided_batched -lcrypto -L/opt/rocm/rocblas/lib/ -lrocblas
ADD_FLAG = -w

all: sgemm_strided_batched.o
		/opt/rocm/hip/bin/hipcc $^ ${INC_PATH} ${ADD_FLAG} ${LIB_PATH} -o lib/sgemm_strided_batched
		/opt/rocm/hip/bin/hipcc sgemm_strided_batch_naive.cpp ${INC_PATH} ${ADD_FLAG} ${LIB_PATH}  -o lib/sgemm_strided_batched_naive
sgemm_strided_batched.o: sgemm_strided_batched.cpp
		/opt/rocm/hip/bin/hipcc -c $< ${INC_PATH} ${ADD_FLAG} ${LIB_PATH} -o $@

final:sgemm_strided_batched.o
		/opt/rocm/hip/bin/hipcc $^ ${INC_PATH} ${ADD_FLAG} ${LIB_PATH} -o lib/sgemm_strided_batched
sgemm_strided_batched.o: sgemm_strided_batched.cpp
		/opt/rocm/hip/bin/hipcc -c $< ${INC_PATH} ${ADD_FLAG} ${LIB_PATH} -o $@

naive:		
		/opt/rocm/hip/bin/hipcc sgemm_strided_batch_naive.cpp  ${INC_PATH} ${ADD_FLAG} ${LIB_PATH} -o lib/sgemm_strided_batched_naive

compile_co:
		/opt/rocm/hip/bin/hipcc sgemm_sqc.cpp -o sgemm_sqc	
		/opt/rocm/bin/extractkernel -i sgemm_sqc
		/opt/rocm/hcc/bin/clang -x assembler -target amdgcn--amdhsa -mcpu=gfx906 -mno-code-object-v3 sgemm_sqc.s -o sgemm_sqc.co
	
test: sgemm_test.cpp
		/opt/rocm/hip/bin/hipcc sgemm_test.cpp ${INC_PATH} ${ADD_FLAG} ${LIB_PATH} -o lib/sgemm_strided_batched_test
	
clean:
		rm -rf *.o
		rm -rf lib/sgemm_strided_batched*
		rm -rf sgemm_sqc-*
		rm -rf sgemm_sqc
		rm -rf *.o
		rm -rf sgemm
		rm -rf *.s

