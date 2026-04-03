#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --job-name=apptainer-job
#SBATCH --output=apptainer-%j.log
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G

module load anaconda3/2024.02-1

conda install --yes --file requirements.txt

python example.py
