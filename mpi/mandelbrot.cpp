#include <cstdio>
#include <cstdlib>
#include "mpi.h"
#include "omp.h"

// return 1 if in set, 0 otherwise
int inset(double real, double img, int maxiter){
    double q = (real - 0.25)*(real - 0.25) + img*img;
    if(q*(q+(real - 0.25)) < 0.25*img*img || (real+1)*(real+1) + img*img < 1/16)
        return 1;

    double z_real = real;
    double z_img = img;

    for(int iters = 0; iters < maxiter; iters++){

        double z2_real = z_real*z_real-z_img*z_img;
        double z2_img = 2.0*z_real*z_img;
        z_real = z2_real + real;
        z_img = z2_img + img;

        if(z_real*z_real + z_img*z_img > 4.0) return 0;
    }

    return 1;
}

// main
int main(int argc, char *argv[]){
    double real_lower;
    double real_upper;
    double img_lower;
    double img_upper;
    int num;
    int maxiter;
    int num_regions = (argc-1)/6;

    //double start = omp_get_wtime();

    MPI_Init(&argc,&argv);

    for(int region=0;region<num_regions;region++){
        // scan the arguments

        sscanf(argv[region*6+1],"%lf",&real_lower);
        sscanf(argv[region*6+2],"%lf",&real_upper);
        sscanf(argv[region*6+3],"%lf",&img_lower);
        sscanf(argv[region*6+4],"%lf",&img_upper);
        sscanf(argv[region*6+5],"%i",&num);
        sscanf(argv[region*6+6],"%i",&maxiter); 

        int count=0;
        double real_step = (real_upper-real_lower)/num;
        double img_step = (img_upper-img_lower)/num;

        int size, rank;
        MPI_Comm_size(MPI_COMM_WORLD, &size);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);

        int new_num = ((real_upper-real_lower)/size) /real_step;

        if(rank != size -1){
            #pragma omp parallel
            {
                #pragma omp for schedule(dynamic) reduction(+:count) nowait
                for(int real = rank * new_num; real <= (rank+1)*new_num-1; real++){
                    for(int img=0; img<=num; img++){
                        count+=inset(real_lower + real * real_step,img_lower+img*img_step,maxiter);
                    }
                }
            }
        }
        else{
            #pragma omp parallel
            {
                #pragma omp for schedule(dynamic) reduction(+:count) nowait
                for(int real = rank * new_num; real <= num; real++){
                    for(int img=0; img<=num; img++){
                        count+=inset(real_lower+real*real_step,img_lower+img*img_step,maxiter);
                    }
                }
            }
        }

        int global_sum = 0;
        MPI_Reduce(&count, &global_sum, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

        if(rank == 0)
            printf("%d\n", global_sum);

    }
    MPI_Finalize();

    //double end = omp_get_wtime();

    //printf("Time = %fs\n", end-start);

    return EXIT_SUCCESS;
}