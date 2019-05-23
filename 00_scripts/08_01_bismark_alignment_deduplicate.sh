#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark_deduplicate
BISMARK_ENV=". /appli/bioinfo/bismark/0.19/env.sh" #version 0.19

# An important step is the removal of PCR artifacts. You could’ve used the picard tools for this step, but let’s use the deduplication tool from Bismark

$BISMARK_ENV
cd $DATADIRECTORY

deduplicate_bismark --bam $DATADIRECTORY/Index_10.2-V-620_R1_paired_bismark_bt2_pe.bam > $OUTPUT/2-V-620_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_11.3-V-620_R1_paired_bismark_bt2_pe.bam > $OUTPUT/3-V-620_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_1.3-R-180_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/3-R-180_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_18.1-J-2_R1_paired_bismark_bt2_pe.bam   > $OUTPUT/1-J-002_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_19.2-J-2_R1_paired_bismark_bt2_pe.bam   > $OUTPUT/2-J-002_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_20.3-J-2_R1_paired_bismark_bt2_pe.bam   > $OUTPUT/3-J-002_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_21.1-J-7_R1_paired_bismark_bt2_pe.bam   > $OUTPUT/1-J-007_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_2.1-R-183_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/1-R-183_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_22.2-J-7_R1_paired_bismark_bt2_pe.bam   > $OUTPUT/2-J-007_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_23.3-J-7_R1_paired_bismark_bt2_pe.bam   > $OUTPUT/3-J-007_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_25.1-R-180_R1_paired_bismark_bt2_pe.bam > $OUTPUT/1-R-180_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_27.2-R-180_R1_paired_bismark_bt2_pe.bam > $OUTPUT/2-R-180_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_3.2-R-183_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/2-R-183_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_5.3-R-183_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/3-R-183_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_6.1-V-613_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/1-V-613_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_7.2-V-613_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/2-V-613_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_8.3-V-613_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/3-V-613_bismark_deduplicate.bam
deduplicate_bismark --bam $DATADIRECTORY/Index_9.1-V-620_R1_paired_bismark_bt2_pe.bam  > $OUTPUT/1-V-620_bismark_deduplicate.bam



