#!/bin/bash

#BSUB -P UBOI0002                # your project code, such as UUOM4321 or P87654321
#BSUB -n 8                       # number of tasks in job
#BSUB -R "span[ptile=2]"         # run 2 MPI tasks per node
#BSUB -J GB_Subset_CESM-LE       # your name for the job
#BSUB -W 12:00                   # wall-clock time (hrs:mins)
#BSUB -o GB-SS-CESM-LE.%J.out    # your output file name in which %J is replaced by the job ID
#BSUB -e GB-SS-CESM-LE.%J.err    # your error file name in which %J is replaced by the job ID
#BSUB -q regular                 # queue

# Set environment variable
export MP_PGMMODEL=mpmd

# Run the file
mpirun.lsf -cmdfile /glade/u/home/aflores/Subset_CESM_LE_geog_batch.txt
