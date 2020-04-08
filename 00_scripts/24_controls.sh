#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.27.1/env.sh" # https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

cd $DATADIRECTORY

$BEDTOOLS_ENV


bedtools intersect -a selected_02.gff -b Correspondance_scaff_07.gff -wa -wb > selected_corresp.txt
bedtools intersect -b selected_02.gff -a Correspondance_scaff_07.gff -wa -wb > selected_corresp_02.txt


