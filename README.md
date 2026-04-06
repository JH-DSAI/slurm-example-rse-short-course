# Apptainer/Module Examples for the DSAI Cluster

This repo shows how to setup a python environment using `module` and `apptainer`
on the DSAI cluster.

The example script `main.py` trains a random forest classifier on the
iris dataset (https://archive.ics.uci.edu/dataset/53/iris).


## Setup

### Clone the repo locally

(There is `git` on the cluster, but we want the at least one file available locally)

```bash
git clone https://github.com/JH-DSAI/slurm-example-rse-short-course.git
cd slurm-example-rse-short-course
```

### Move the files common to both examples over to the cluster

```bash
# get our userid from the cluster
export DSAI_ID=$(ssh dsai "echo \$USER")
# We'll use the shared scratch space (/scratch/ehunte18) for this and make our own dir
export REMOTE_PATH="/scratch/ehunte18/${DSAI_ID}/rse-example"
scp iris.data main.py dsai:${REMOTE_PATH}/
```

## Running the script using Apptainer

First, build the image, you need to have Apptainer [installed](https://apptainer.org/docs/admin/main/installation.html):

```bash
sudo apptainer build ./images/python_ml.sif ./images/python_ml.def
```

Next, move the image over to the cluster

```bash
export DSAI_ID=$(ssh dsai "echo \$USER")
export REMOTE_PATH="/scratch/ehunte18/${DSAI_ID}/rse-example"

# Add a directory for storing the images we built.
ssh dsai "mkdir -p ${REMOTE_PATH}/images"

# Copy the built image over
scp images/python_ml.sif dsai:${REMOTE_PATH}/images/
# Copy over the sbatch script
scp sbatch_apptainer.sh dsai:${REMOTE_PATH}/
```

Now jump on the cluster and run the script

```bash
ssh dsai
cd /scratch/ehunte18/$USER/rse-example
sbatch sbatch_apptainer.sh
```

When the job is done you should see two new files in the directory:

- `apptainer-<job-id>.log` (The output logs from the job)
- `rf_model.pkl` (Our trained model) 🎉🎉🎉

You can see the logs by running:

```bash
cat apptainer-<job-id>.log
```

## Running the script using module

Move the `sbatch` script and requirements file over to the cluster

```bash
export DSAI_ID=$(ssh dsai "echo \$USER")
export REMOTE_PATH="/scratch/ehunte18/${DSAI_ID}/rse-example"

scp sbatch_modules.sh requirements.txt dsai:${REMOTE_PATH}/
```

Now jump on the cluster and run the script

```bash
ssh dsai
cd /scratch/ehunte18/$USER/rse-example
sbatch sbatch_modules.sh
```

When the job is done you should see two new files in the directory:

- `module-<job-id>.log` (The output logs from the job)
- `rf_model.pkl` (Our trained model) 🎉🎉🎉

You can see the logs by running:

```bash
cat module-<job-id>.log
```
