#!/bin/bash

SIM_DIR=$(dirname $(realpath $0))
PYTHON=$(which python3)
#INFRS=(16 32 64 128 256 512)
INFRS=(16 32 64)
RATES=(0.1 0.2 0.4 0.5)

# check if there are two arguments
echo "Running all experiments..."
# for i in {0..5}; do
#     for j in {0..4}; do
#         ${PYTHON} ${SIM_DIR}/experiment.py ${INFRS[$i]} ${RATES[$j]}
#     done    
# done
parallel -j8 ${PYTHON} ${SIM_DIR}/experiment.py ::: ${INFRS[@]} ::: ${RATES[@]}