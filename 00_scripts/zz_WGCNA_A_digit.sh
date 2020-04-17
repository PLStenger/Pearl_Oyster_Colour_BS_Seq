#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/11_A_digitifera_mat
WGCNA_ENV=/home1/datawork/plstenge/96_env_conda/wgcna 

SCRIPT_FOLDER=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/00_scripts

$WGCNA_ENV
cd $DATADIRECTORY


#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/wgcna

SCRIPT_R=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/00_scripts/zz_WGCNA_A_digit.R

Rscript --vanilla $SCRIPT_R > ${SCRIPT_FOLDER}/zz_WGCNA_A_digit.out
