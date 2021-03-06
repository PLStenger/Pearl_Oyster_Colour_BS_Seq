#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/08_methylkit
METHYLKIT_ENV=/home1/datawork/plstenge/96_env_conda/methylkit 

SCRIPT_FOLDER=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/00_scripts

$METHYLKIT_ENV
cd $DATADIRECTORY


#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/methylkit 

SCRIPT_R=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/00_scripts/10_methylkit_CpG_calling.R

Rscript --vanilla $SCRIPT_R > ${SCRIPT_FOLDER}/10_methylkit_CpG_calling.out


