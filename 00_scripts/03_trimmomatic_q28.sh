#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# Header
DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed
#SCRIPT=$0
#HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
#TRIMMOMATICENV=". /appli/bioinfo/trimmomatic/latest/env.sh"
#TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
#LOG_FOLDER=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/98_log_files
#NAME=$(basename $0)

cd $DATADIRECTORY

# Global variables

#>Illumina_TruSeq_LT_R1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC
#>Illumina_TruSeq_LT_R2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
ADAPTERFILE=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta
#NCPU=8
#base=__BASE__

# Lunch this one first time in order to obtain the script below
for i in `ls -1 *R1*.fastq.gz | sed 's/\_R1.fastq.gz//'`; do echo trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY/$i\_R1.fastq.gz $DATADIRECTORY/$i\_R2.fastq.gz $DATAOUTPUT/$i\_R1_paired.fastq.gz $DATAOUTPUT/$i\_R1_unpaired.fastq.gz $DATAOUTPUT/$i\_R2_paired.fastq.gz $DATAOUTPUT/$i\_R2_unpaired.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40 >> $DATAOUTPUT/cmd_file_for_trimmomatic; done


### Parameter explanations:
 ## - LEADING: quality: Specifies the minimum quality required to keep a base.
  # Remove low quality bases from the beginning. As long as a base has a value below this threshold the base 
  # is removed and the next base will be investigated.
 ## - TRAILING: quality: Specifies the minimum quality required to keep a base.
  # Remove low quality bases from the end. As long as a base has a value below this threshold the base is removed and 
  # the next base (which as trimmomatic is starting from the 3‟ prime end would be base preceding the just removed base) 
  # will be investigated. This approach can be used removing the special illumina „low quality segment‟ regions 
  # (which are marked with quality score of 2), but we recommend Sliding Window or MaxInfo instead
 ## - SLIDINGWINDOW: windowSize: specifies the number of bases to average across 
  #                # requiredQuality: specifies the average quality required.
  # Perform a sliding window trimming, cutting once the average quality within the window falls below a threshold. 
  # By considering multiple bases, a single poor quality base will not cause the removal of high quality data later in the read.               
 ## - MINLEN: length: Specifies the minimum length of reads to be kept.
  # This module removes reads that fall below the specified minimal length. If required, it should normally be after all other processing steps. 
  # Reads removed by this step will be counted and included in the „dropped reads‟ count presented in the trimmomatic summary.

#$TRIMMOMATICENV

