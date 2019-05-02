#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
READS=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/05_concatenated
GENOME=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/
OUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
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
#cd $GENOME

bismark -l 20 -n 0 -p 4 -q --genome $GENOME -1 $READS/Index_10.2-V-620_R1_paired.fastq.gz -2 $READS/Index_10.2-V-620_R2_paired.fastq.gz > $OUTPUT/Index_10.2-V-620.sam 
