
#!/bin/bash -x

# move to run directory
cd /docker/run/

# define environment
NTASKS_PER_SOCKET=32
export MCA_OPTS="--mca orte_base_help_aggregate 1 --mca btl_vader_single_copy_mechanism none"
export MPI_OPTS="--report-bindings --bind-to core --map-by ppr:$NTASKS_PER_SOCKET:socket"
export UCX_LOG_LEVEL=FATAL
ulimit -s unlimited

# run
time mpirun ${MCA_OPTS} ${MPI_OPTS} bigdft

bash
