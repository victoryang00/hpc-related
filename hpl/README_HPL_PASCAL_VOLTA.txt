
This HPL binary package is intended for nvidia TESLA Kepler, Pascal or Volta arch GPUs with high performance double precision (K20/K40/K80 or P100 or V100).

These HPL binaries were built with either openmpi 1.10.2 or 3.1.0 and cuda 9.0 or 9.1 or 9.2 and intel mkl.


File list :
***********

HPL.dat_*  		# various HPL.dat files used in the examples

run_1_node_*		# various main launch script with for 1 node examples
run_2_node_*         # various main launch script with for 2 node examples

run_linpack_*    	# various input script examples called by main launch script  - used to set cpu:gpu affinity and env variables

*_out.txt 		# various sample output from running the examples on nvidia psg cluster nodes


xhpl_cuda9.0.176_mkl_2018_ompi_1.10.2_gcc485_sm35_sm60_sm70_5_18_18     	# various HPL binaries link either openmpi version 1.10.x or 3.1.x and either cuda 9.0, 9.1 or 9.2 as the filenames indicate
xhpl_cuda9.0.176_mkl_2018_ompi_3.1.0_gcc485_sm35_sm60_sm70_5_18_18
xhpl_cuda9.1.85_mkl_2018_ompi_1.10.2_gcc485_sm35_sm60_sm70_5_18_18
xhpl_cuda9.1.85_mkl_2018_ompi_3.1.0_gcc485_sm35_sm60_sm70_5_18_18
xhpl_cuda9.2.88_mkl_2018_ompi_1.10.2_gcc485_sm35_sm60_sm70_5_18_18
xhpl_cuda9.2.88_mkl_2018_ompi_3.1.0_gcc485_sm35_sm60_sm70_5_18_18


Setup :
**************************************

Example running scripts and HPL.dat files are included in addition to sample outputs.

These are intended as examples only and will typically need some minor system specific edits to set system specific PATHs to openmpi and to adjust for the number of CPU cores and cpu:gpu affinity.

These examples can be used as a starting point and modified to fit the details of your specific target system.

1. Select the run environment from below options and make sure that the selected openmpi and cuda versions are installed as well as numactl.

	* cuda 9.0 with openmpi 1.10.x
	* cuda 9.0 with openmpi 3.1.x
	* cuda 9.1 with openmpi 1.10.x
	* cuda 9.1 with openmpi 3.1.x
	* cuda 9.2 with openmpi 1.10.x
	* cuda 9.2 with openmpi 3.1.x

2. Modify the main run script (run_x_node_xxxxx)

Set the PATH and LD_LIBRARY_PATH or load modules as needed for your specific system so that the openmpi and cuda version you want to run is in the running environment.

Set the number of MPI process equal to the total number of GPUs in the run. 

Check that the run_linpack_xxxx and HPL.dat file you reference is the one you intend.

Set GPU clock if desired using nvidia-smi. 


3. Modify the input script (run_linpack_xxxxxx)

Set CPU_CORES_PER_RANK.  

Check CPU:GPU affinity. The case statement uses numactl and CUDA_VISIBLE_DEVICES to bind GPUs to the CPU socket they are attached to whenever practical. 

Make sure that APP variable is pointing to the HPL binary that matches your running env


4. Modify the HPL.dat

The examples include several reference HPL.dat_xxxxxxx files used by the example run scripts. You may want to modify one of them to match your system configuration and for tuning performance.

PxQ must equal the number of GPUs. 

N and NB will be key variables to adjust for perf tuning.



HPL running and tuning tips :
**************************************

The number of MPI ranks should always equal the total number of GPUs for the run.

In most cases best performance with P100 or V100 GPUs come with N sized so that the problem fits in GPU memory or just slightly larger. The HPL output includes an indication of estimated memory per rank used which is useful to see how increasing N will increase GPU memory used eventually exceeding GPU memory. That output looks like: "Per-Process Host Memory Estimate: 16.43 GB (MAX) 16.43 GB (MIN)".

Smaller NB values generally work best in nodes with P100 or V100 GPUs (ie 256, 288, 320, 384) especially when there are 4 or more GPUs/node.

Using larger N and larger NB values (ie 768, 896, 1024 or higher) can sometimes help performance. This is most likely in cases with 2 GPUs and 1:1 CPU:GPU topology.

Keep N an even multiple of NB.

For setting the CPU:GPU affinity it may be useful to run "nvidia-smi topo -m". For systems where there is a balanced topology with equal number of GPUs on each CPU socket then you want to bind the GPUs and CPUs consistent with how they are physically connected. For unbalanced topology you may want to experiment with either leaving some cores unused or binding GPUs to sockets they are not attached to and see what works for particualr config.

CPU_CORES_PER_RANK  typically set to the total number of (physical) cores in the node and divide by the number of GPUs/node. In many cases also reserving a few cores will help performance. Some experimentation is needed to fine tune this. For example if you have 40 cores per node and 4 GPUs per node you may set this value to 10 and also experiment with setting it to 8 or 9 and see what works best for your configuration. Also suggest to disable hyperthreading on the nodes.

GPU_DGEMM_SPLIT is a variable to adjust how DGEMM workload is divided between GPUs and CPUs. With P100 and V100 nodes typically its best to set GPU_DGEMM_SPLIT=1.0 or very close to 1.0. This puts 100% of DGEMM work on the GPUs.  Note this only affects the portion of the problem that is not fitting in the GPUs memory. GPU_DGEMM_SPLIT will be 1.0 always for the portion of the problem that is in GPU memory. As result this is most potential for cases with only 1 or 2 GPUs node and with higher end CPUs and using larger N values.

TRSM_CUTOFF controls when the CPU vs GPU does the TRSM computation. With P100 or V100 GPUs typically works well to set this value to 100000 (some value larger than N) to move all TRSM work to the GPUs. If you set to 0 all the TRSM work would be on the CPU. You can (for example) set to a value between 0 and N (for single node test maybe 20000) to split the work between CPU and GPUs. In this case the CPU does TRSM at the beginning of the run and the GPU does it at the end when CPUs become busier. Try adjusting from there to see how it affects performance and tune in the best result. Optimal value depends on CPU type and system. This is most likely to help perfonly slightly. It is most likely to be useful for cases with higher end CPUs and fewer GPUs per node.

Adjusting the clock to prevent the GPU from boosting to the max clock will probably help performance and reduce variability a little bit. For example the command line below will adjust the clock for SXM2 P100 to 1392 or 1404MHz typically works pretty well. To find available clock choices for the GPU you are running on you can run "nvidia-smi --query-supported-clocks=gr --format=csv -i 0". It is generally best to find a value as high as possible but just when you begin to hit the power limit on the slowest ranks and clock throttling starts. Tuning this value will tend to be more important when running on large number of nodes and less critical for running on a single node. 

	nvidia-smi -ac 715,1189  	# base clock for P100 PCIe
	nvidia-smi -ac 715,1328		# base clock for P100 SXM2
	nvidia-smi -ac 715,1404		# boosted clock for P100......typically works well for P100 SXM2, you want to tune this value to limit clock throttling and maximize performance for your configuration or for different GPUs
        nvidia-smi -ac 877,1245         # base clock for V100 PCIe
        nvidia-smi -ac 877,1312         # base clock for V100 SXM2

In some cases also reserving a few CPU core for non-HPL overhead will help performance. For example if you have 40 cores running with 4 GPUs you may want to try running with 10 cores per GPU and also with 8 cores per GPU to see which works best.

If you want to run HPL in a looping fashion with same parameters you could set variable below for example :

	export TEST_LOOPS=100

An alternative looping approach could be to modify the HPL.dat file to include up to 20 N, NB or possibly other variables to generate all combinations. Something like below excerpt would generate 6x20=120 runs with all combinations of N and NB in the list.

	20            # of problems sizes (N)
	79872 82944 86016 89088 92160 95232 98304 101376 104448 107520 110592 113664 116736 119808 122880 125952 129024 132096 135168 138240 Ns
	6             # of NBs
	128 256 384 512 768 1024 768 896 768 1024 512 384 640 768 896 960 1024 1152 1280 384 640 960 768 640 256  960 512 768 1152         NBs


There is a set of variables below that enable some warnings in line with the HPL output. You will typically want to adjust the values for particular system and GPUs so that warnings are generated only for marginal or unexpected behavior. If you want to disable these warnings you can set MONITOR_GPU=0. These warning are most valuable when running at large scale making it easier to spot a particual node or GPU has some kind of problem.

	export MONITOR_GPU=1

	export GPU_TEMP_WARNING=80		# If any GPU reports temp above this threshold 
	export GPU_CLOCK_WARNING=1328		# If any GPU reports clock below this threshold
	export GPU_POWER_WARNING=280		# If any GPU reports power above this threshold
	export GPU_PCIE_GEN_WARNING=3		# If any GPU reports PCIe gen not equal to this value
	export GPU_PCIE_WIDTH_WARNING=16	# If any GPU reports PCIe width not equal to this value


By default the HPL examples enable a system test scan which will generate some output like below indicating the performance characteristics of the individual MPI ranks for metrics that are important to HPL performance. This test runs with same basic setup that you have defined for the main HPL run so that means the number of MPI ranks, the setup for CPU:GPU affinity, the CPU_CORES_PER_RANK and GPU clock settings etc will affect how this test runs similarly. It is useful to see if there is a big delta between the min and max for certain parameters which might indicate a problem. It is also useful when comparing performance of faster nodes and slower nodes to get some clue where the difference may be coming from. If you want to disable this system test feature you can set TEST_SYSTEM_PARAMS=0.


	export TEST_SYSTEM_PARAMS=1

	        ******** TESTING SYSTEM PARAMETERS ********
	        PARAM   [UNITS]         MIN     MAX     AVG
	        -----   -------         ---     ---     ---
	CPU :
	        CPU_BW  [GB/s ]         16.8    16.9    16.8
	        CPU_FP  [GFLPS]
	                NB =   32         45      45      45
	                NB =   64         88      89      88
	                NB =  128        137     138     137
	                NB =  256        163     166     164
	                NB =  512        185     187     186
	PCIE (NVLINK on IBM) :
	        H2D_BW  [GB/s ]         5.4     5.4     5.4
	        D2H_BW  [GB/s ]         5.8     5.8     5.8
	        BID_BW  [GB/s ]         8.7     8.7     8.7
	CPU_BW concurrent with BID_BW :
	        CPU_BW  [GB/s ]         13.6    13.6    13.6
	        BID_BW  [GB/s ]         5.2     5.3     5.2
	GPU :
	        GPU_BW  [GB/s ]         518     519     518
	        GPU_FP  [GFLPS]
	                NB =  128       3614    3721    3665
	                NB =  256       4099    4120    4110
	                NB =  384       4350    4375    4362
	                NB =  512       4316    4340    4327
	                NB =  640       4422    4446    4433
	                NB =  768       4388    4408    4397
	                NB =  896       4445    4473    4458
	                NB = 1024       4423    4446    4437
	NET :
	        PROC COL NET_BW [MB/s ]
	                     8 B          45      46      46
	                    64 B         288     310     299
	                   512 B        1222    1238    1230
	                     4 KB       4701    4716    4708
	                    32 KB       14992   15202   15097
	                   256 KB       19435   19502   19469
	                  2048 KB       8235    8296    8265
	                 16384 KB       8117    8260    8189
	        NET_LAT [ us  ]         0.6     0.7     0.7

	        PROC ROW NET_BW [MB/s ]
	                     8 B          29      29      29
	                    64 B         177     178     178
	                   512 B         715     738     727
	                     4 KB       3111    3233    3172
	                    32 KB       11855   12030   11943
	                   256 KB       18271   18749   18510
	                  2048 KB       7235    7388    7311
	                 16384 KB       7284    7462    7373
	        NET_LAT [ us  ]         0.9     1.1     1.0



When running tests on multiple nodes, it is strongly advised to run HPL on each node individually (and simultaneously) first to verify performance is expected and consistent across all the nodes before running multiple nodes in larger scale HPL run. It is also useful to break down large number of nodes running on smaller groups before running very large scale test. This kind of approach help to isolate individual slow nodes and or network issues so they can be resolved or excluded from the very large scale test. It is much harder to diagnose slow performance on large test if this approach is not used. At scale a single slow node or GPU or network connection can end up throttling the performance of all the good nodes because every rank will get equal work and the slow node ends up causing all the good nodes to wait. One of most critical aspects of successful large scale test will always be to carefully scrub the individual nodes and connections are all good as a first step.













