# Apptainer/Module Examples for the DSAI Cluster




This has some example files that will be used for demoing the use of the SLURM
cluster for the RSE short course.


The Iris dataset comes from the UCI ML repository:

https://archive.ics.uci.edu/dataset/53/iris

To build the container:

```bash
apptainer build train_model.sif train_model.def
```

To run the container locally we need to bind mount the output directory

```bash
apptainer run --bind ../output:/output train_model.sif
```

On the cluster you can bind mount the scratch directory to the output directory
