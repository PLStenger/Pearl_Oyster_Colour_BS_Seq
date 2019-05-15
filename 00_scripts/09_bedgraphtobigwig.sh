#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/07_bismark_methylation_extractor

cd $DATADIRECTORY

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate /home1/datawork/plstenge/bedgraphtobigwig

# Unzip
#gzip -d $DATADIRECTORY/Index_10.2-V-620_R1_paired_bismark_bt2_pe.bedGraph.gz > $DATADIRECTORY/Index_10.2-V-620_R1_paired_bismark_bt2_pe.bedGraph

# The input bedGraph file must be sorted
sort -k1,1 -k2,2n $DATADIRECTORY/Index_10.2-V-620_R1_paired_bismark_bt2_pe.bedGraph > $DATADIRECTORY/Index_10.2-V-620_R1_paired_bismark_bt2_pe_sorted.bedGraph

bedGraphToBigWig $DATADIRECTORY/Index_10.2-V-620_R1_paired_bismark_bt2_pe_sorted.bedGraph $DATADIRECTORY/Index_10.2-V-620_R1_paired_bismark_bt2_pe_sorted.bw
