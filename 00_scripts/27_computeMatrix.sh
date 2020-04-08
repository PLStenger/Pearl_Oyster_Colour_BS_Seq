#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
REFERENCE=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome/sspace.final.scaffolds_no_pipe_size.bed

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate $DATAWORK/96_env_conda/deeptools


computeMatrix scale-regions -S Index_10.2-V-620_R1_paired_bismark_bt2_pe.deduplicated.bam.sam_sorted_clean.bam.bw -R $REFERENCE --beforeRegionStartLength 3000 --regionBodyLength 5000 --afterRegionStartLength 3000 -o matrix.mat.gz

plotProfile -m matrix.mat.gz -out ExampleProfile1.png --numPlotsPerRow 2 --plotTitle "Test data profile"
