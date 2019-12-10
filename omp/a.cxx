#include <stdio.h>
#include <omp.h>

#define N 2
int t[N];

int main()
{
omp_set_num_threads(N);
#pragma omp parallel
	{
	 int i =omp_get_thread_num();
	 while(1){
#pragma omp barrier
	 t[i]=1;
	 printf("%d ",t[(i+1)%N]);
#pragma omp barrier
	 t[i]=0;
#pragma omp single
	 printf("\n");
	}
}
return 0;
}
