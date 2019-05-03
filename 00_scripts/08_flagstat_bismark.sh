#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


#Global variables
INPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/07_flagstat
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $INPUT
$SAM_ENV

$SAMTOOLS flagstat $INPUT/*.bam > $OUTPUT/Index_10.2-V-620_R1_paired_bismark_bt2_pe_flagstat.txt
