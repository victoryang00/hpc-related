mpic++ -fopenmp mandelbrot.cpp -o test_mpi
mpirun -n 4 ./test_mpi -2.0 1.0 -1.0 1.0 100 10000 -1 1.0 0.0 1.0 100 10000
