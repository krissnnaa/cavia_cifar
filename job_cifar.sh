#!/bin/bash -l
#SBATCH --account dblf --partition tier3
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=8g
#SBATCH --gres=gpu:p4:1

srun -n 1 python3 main.py --tasks_per_metaupdate $batch --num_context_params $context --num_filters $filter
