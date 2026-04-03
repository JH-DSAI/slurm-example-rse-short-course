#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --job-name=apptainer-job
#SBATCH --output=apptainer-%j.log
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G

cd /scratch/ehunte18/$USER/rse-example

apptainer run images/python_ml.sif main.py
