#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --job-name=apptainer-job
#SBATCH --output=apptainer-%j.log
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G

apptainer run  --bind /scratch/ehunte18/rhausen1/train_model:/output /home/rhausen1/apptainer/train_model.sif
