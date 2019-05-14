#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/07_bismark_methylation_extractor
READS=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/05_concatenated
GENOME=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome
BAM=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/07_bismark_methylation_extractor
#PATHTOFILE=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/07_bismark_methylation_extractor/output_extractor
BISMARK_ENV=". /appli/bioinfo/bismark/0.19/env.sh" #version 0.19
NCPU=4

cd $DATADIRECTORY
$BISMARK_ENV

#bismark_methylation_extractor -s --bedGraph --counts --buffer_size 10G -- cytosine_report --genome_folder $GENOME Index_10.2-V-620_R1_paired_bismark_bt2_pe.bam
#bismark_methylation_extractor -p --no_overlap --report Index_10.2-V-620_R1_paired_bismark_bt2_pe.bam


bismark_methylation_extractor -p --no_overlap --bedGraph --scaffolds --cytosine_report --genome_folder $GENOME --multicore $NCPU -o $BAM/Index_10.2-V-620_R1_paired_bismark_bt2_pe.bam $OUTPUT/result_


