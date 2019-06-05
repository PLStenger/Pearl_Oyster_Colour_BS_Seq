#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $DATADIRECTORY

$SAM_ENV

samtools view -b
samtools view -b
samtools view -b
