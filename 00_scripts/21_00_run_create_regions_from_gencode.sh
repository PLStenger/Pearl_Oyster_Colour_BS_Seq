#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/scratch/plstenge/genome/

cd $DATAWORK

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/GenomicFeatures

SCRIPT_R=/home1/scratch/plstenge/genome/create_regions_from_gencode.R

# create_regions_from_gencode.R is from https://github.com/saketkc/gencode_regions

Rscript --vanilla $SCRIPT_R /home1/scratch/plstenge/genome/results/EVM_combined.gff /home1/scratch/plstenge/genome/results >& ${SCRATCH}/17_00_26_unique_snp_finish.out
