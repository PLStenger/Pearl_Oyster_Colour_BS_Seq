#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


#DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
DATADIRECTORY=/home1/scratch/plstenge/bismark_alignment
READS=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/05_concatenated
GENOME=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome
#OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
OUTPUT=/home1/scratch/plstenge/bismark_alignment

BISMARK_ENV=". /appli/bioinfo/bismark/0.19/env.sh" #version 0.19

# Options
# Standard alignments use a multi-seed length of 20bp (-l 20) with 0 mismatches (-n 0)
# -q/--fastq The query input files (specified as <mate1>,<mate2> or <singles> are FASTQ files)
# If Paired-End Reads:
  ## Minimum insert size for valid paired-end alignments:
  # E.g. if -I 60 is specified and a paired-end alignment consists of two 20-bp alignments in the appropriate orientation with a 20-bp gap between them, that alignment is considered valid (as long as -X is also satisfied). A 19-bp gap would not be valid in that case. Default: 0.
  ## Alignment option -I/--minins <INT>: 
  # Maximum insert size for valid paired-end alignments. The maximum insert size for valid paired-end alignments. 
  # E.g. if -X 100 is specified and a paired-end alignment consists of two 20-bp alignments in the proper orientation with a 60-bp gap between them, that alignment is considered valid (as long as -I is also satisfied). A 61-bp gap would not be valid in that case. Default: 500. Alignment option -X/--maxins <INT>
# -p 4 =			#THREADS

$BISMARK_ENV
cd $DATADIRECTORY

#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_1.3-R-180_R1_paired.fastq.gz -2 $READS/Index_1.3-R-180_R2_paired.fastq.gz   > $OUTPUT/Index_1.3-R-180.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_10.2-V-620_R1_paired.fastq.gz -2 $READS/Index_10.2-V-620_R2_paired.fastq.gz > $OUTPUT/Index_10.2-V-620.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_11.3-V-620_R1_paired.fastq.gz -2 $READS/Index_11.3-V-620_R2_paired.fastq.gz > $OUTPUT/Index_11.3-V-620.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_18.1-J-2_R1_paired.fastq.gz -2 $READS/Index_18.1-J-2_R2_paired.fastq.gz     > $OUTPUT/Index_18.1-J-2.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_19.2-J-2_R1_paired.fastq.gz -2 $READS/Index_19.2-J-2_R2_paired.fastq.gz     > $OUTPUT/Index_19.2-J-2.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_2.1-R-183_R1_paired.fastq.gz -2 $READS/Index_2.1-R-183_R2_paired.fastq.gz   > $OUTPUT/Index_2.1-R-183.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_20.3-J-2_R1_paired.fastq.gz -2 $READS/Index_20.3-J-2_R2_paired.fastq.gz     > $OUTPUT/Index_20.3-J-2.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_21.1-J-7_R1_paired.fastq.gz -2 $READS/Index_21.1-J-7_R2_paired.fastq.gz     > $OUTPUT/Index_21.1-J-7.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_22.2-J-7_R1_paired.fastq.gz -2 $READS/Index_22.2-J-7_R2_paired.fastq.gz     > $OUTPUT/Index_22.2-J-7.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_23.3-J-7_R1_paired.fastq.gz -2 $READS/Index_23.3-J-7_R2_paired.fastq.gz     > $OUTPUT/Index_23.3-J-7.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_25.1-R-180_R1_paired.fastq.gz -2 $READS/Index_25.1-R-180_R2_paired.fastq.gz > $OUTPUT/Index_25.1-R-180.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_27.2-R-180_R1_paired.fastq.gz -2 $READS/Index_27.2-R-180_R2_paired.fastq.gz > $OUTPUT/Index_27.2-R-180.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_3.2-R-183_R1_paired.fastq.gz -2 $READS/Index_3.2-R-183_R2_paired.fastq.gz   > $OUTPUT/Index_3.2-R-183.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_5.3-R-183_R1_paired.fastq.gz -2 $READS/Index_5.3-R-183_R2_paired.fastq.gz   > $OUTPUT/Index_5.3-R-183.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_6.1-V-613_R1_paired.fastq.gz -2 $READS/Index_6.1-V-613_R2_paired.fastq.gz   > $OUTPUT/Index_6.1-V-613.sam
#bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_7.2-V-613_R1_paired.fastq.gz -2 $READS/Index_7.2-V-613_R2_paired.fastq.gz   > $OUTPUT/Index_7.2-V-613.sam
bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_8.3-V-613_R1_paired.fastq.gz -2 $READS/Index_8.3-V-613_R2_paired.fastq.gz   > $OUTPUT/Index_8.3-V-613.sam
bismark -l 30 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_9.1-V-620_R1_paired.fastq.gz -2 $READS/Index_9.1-V-620_R2_paired.fastq.gz   > $OUTPUT/Index_9.1-V-620.sam 

