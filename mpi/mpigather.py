import mpi4py.MPI as MPI
 
comm = MPI.COMM_WORLD
comm_rank = comm.Get_rank()
comm_size = comm.Get_size()
 
if comm_rank == 0:
   data = range(comm_size)
   print data
else:
   data = None
local_data = comm.scatter(data, root=0)
local_data = local_data * 2
print 'rank %d, got and do:' % comm_rank
print local_data
combine_data = comm.gather(local_data,root=0)
if comm_rank == 0:
print combine_data