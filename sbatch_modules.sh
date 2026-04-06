#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --job-name=module-job
#SBATCH --output=module-%j.log
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G

module load anaconda3/2024.02-1

conda create -p /scratch/ehunte18/$USER/rse-example/env python=3.11 --file requirements.txt --yes
conda activate /scratch/ehunte18/$USER/rse-example/env

python main.py
