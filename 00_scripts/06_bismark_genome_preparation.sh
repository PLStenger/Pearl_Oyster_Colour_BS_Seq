#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
#GENOME=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
GENOME=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/
BISMARK_ENV=". /appli/bioinfo/bismark/0.19/env.sh" #version 0.19

$BISMARK_ENV
#cd $DATADIRECTORY
cd $GENOME

bismark_genome_preparation $GENOME
