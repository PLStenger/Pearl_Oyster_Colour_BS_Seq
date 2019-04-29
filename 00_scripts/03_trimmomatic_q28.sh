#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed
TRIMMOMATICENV=". /appli/bioinfo/trimmomatic/latest/env.sh"

# Global variables
ADAPTERFILE=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta
#>Illumina_TruSeq_LT_R1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC
#>Illumina_TruSeq_LT_R2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT

cd $DATADIRECTORY

# Lunch this command line one first time in order to obtain the script below (find it in the DATAOUTPUT folder)
#for i in `ls -1 *R1*.fastq.gz | sed 's/\_R1.fastq.gz//'`; do echo trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY/$i\_R1.fastq.gz $DATADIRECTORY/$i\_R2.fastq.gz $DATAOUTPUT/$i\_R1_paired.fastq.gz $DATAOUTPUT/$i\_R1_unpaired.fastq.gz $DATAOUTPUT/$i\_R2_paired.fastq.gz $DATAOUTPUT/$i\_R2_unpaired.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40 >> $DATAOUTPUT/cmd_file_for_trimmomatic; done


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

$TRIMMOMATICENV

trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_1.3-R-180_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_1.3-R-180_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_1.3-R-180_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_1.3-R-180_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_1.3-R-180_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_1.3-R-180_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_18.1-J-2_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_18.1-J-2_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_18.1-J-2_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_18.1-J-2_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_18.1-J-2_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_18.1-J-2_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_19.2-J-2_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_19.2-J-2_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_19.2-J-2_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_19.2-J-2_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_19.2-J-2_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_19.2-J-2_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_20.3-J-2_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_20.3-J-2_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_20.3-J-2_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_20.3-J-2_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_20.3-J-2_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_20.3-J-2_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_21.1-J-7_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_21.1-J-7_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_21.1-J-7_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_21.1-J-7_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_21.1-J-7_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_21.1-J-7_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_22.2-J-7_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_22.2-J-7_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_22.2-J-7_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_22.2-J-7_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_22.2-J-7_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_22.2-J-7_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_23.3-J-7_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_23.3-J-7_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_23.3-J-7_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_23.3-J-7_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_23.3-J-7_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_23.3-J-7_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_25.1-R-180_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_25.1-R-180_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_25.1-R-180_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_25.1-R-180_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_25.1-R-180_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_25.1-R-180_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_27.2-R-180_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.005.NEBNext_Index_27.2-R-180_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_27.2-R-180_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_27.2-R-180_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_27.2-R-180_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.005.NEBNext_Index_27.2-R-180_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_1.3-R-180_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_1.3-R-180_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_1.3-R-180_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_1.3-R-180_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_1.3-R-180_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_1.3-R-180_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_18.1-J-2_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_18.1-J-2_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_18.1-J-2_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_18.1-J-2_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_18.1-J-2_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_18.1-J-2_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_19.2-J-2_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_19.2-J-2_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_19.2-J-2_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_19.2-J-2_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_19.2-J-2_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_19.2-J-2_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_20.3-J-2_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_20.3-J-2_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_20.3-J-2_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_20.3-J-2_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_20.3-J-2_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_20.3-J-2_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_21.1-J-7_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_21.1-J-7_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_21.1-J-7_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_21.1-J-7_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_21.1-J-7_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_21.1-J-7_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_22.2-J-7_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_22.2-J-7_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_22.2-J-7_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_22.2-J-7_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_22.2-J-7_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_22.2-J-7_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_23.3-J-7_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_23.3-J-7_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_23.3-J-7_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_23.3-J-7_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_23.3-J-7_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_23.3-J-7_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_25.1-R-180_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_25.1-R-180_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_25.1-R-180_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_25.1-R-180_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_25.1-R-180_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_25.1-R-180_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_27.2-R-180_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.006.NEBNext_Index_27.2-R-180_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_27.2-R-180_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_27.2-R-180_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_27.2-R-180_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.006.NEBNext_Index_27.2-R-180_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_10.2-V-620_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_10.2-V-620_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_10.2-V-620_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_10.2-V-620_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_10.2-V-620_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_10.2-V-620_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_11.3-V-620_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_11.3-V-620_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_11.3-V-620_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_11.3-V-620_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_11.3-V-620_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_11.3-V-620_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_2.1-R-183_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_2.1-R-183_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_2.1-R-183_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_2.1-R-183_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_2.1-R-183_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_2.1-R-183_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_3.2-R-183_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_3.2-R-183_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_3.2-R-183_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_3.2-R-183_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_3.2-R-183_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_3.2-R-183_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_5.3-R-183_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_5.3-R-183_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_5.3-R-183_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_5.3-R-183_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_5.3-R-183_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_5.3-R-183_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_6.1-V-613_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_6.1-V-613_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_6.1-V-613_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_6.1-V-613_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_6.1-V-613_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_6.1-V-613_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_7.2-V-613_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_7.2-V-613_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_7.2-V-613_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_7.2-V-613_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_7.2-V-613_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_7.2-V-613_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_8.3-V-613_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_8.3-V-613_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_8.3-V-613_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_8.3-V-613_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_8.3-V-613_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_8.3-V-613_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_9.1-V-620_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.007.NEBNext_Index_9.1-V-620_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_9.1-V-620_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_9.1-V-620_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_9.1-V-620_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.007.NEBNext_Index_9.1-V-620_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_10.2-V-620_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_10.2-V-620_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_10.2-V-620_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_10.2-V-620_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_10.2-V-620_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_10.2-V-620_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_11.3-V-620_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_11.3-V-620_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_11.3-V-620_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_11.3-V-620_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_11.3-V-620_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_11.3-V-620_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_2.1-R-183_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_2.1-R-183_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_2.1-R-183_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_2.1-R-183_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_2.1-R-183_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_2.1-R-183_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_3.2-R-183_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_3.2-R-183_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_3.2-R-183_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_3.2-R-183_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_3.2-R-183_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_3.2-R-183_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_5.3-R-183_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_5.3-R-183_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_5.3-R-183_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_5.3-R-183_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_5.3-R-183_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_5.3-R-183_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_6.1-V-613_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_6.1-V-613_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_6.1-V-613_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_6.1-V-613_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_6.1-V-613_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_6.1-V-613_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_7.2-V-613_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_7.2-V-613_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_7.2-V-613_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_7.2-V-613_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_7.2-V-613_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_7.2-V-613_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_8.3-V-613_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_8.3-V-613_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_8.3-V-613_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_8.3-V-613_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_8.3-V-613_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_8.3-V-613_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40
trimmomatic PE -Xmx60G -threads 8 -phred33 /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_9.1-V-620_R1.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/HI.4828.008.NEBNext_Index_9.1-V-620_R2.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_9.1-V-620_R1_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_9.1-V-620_R1_unpaired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_9.1-V-620_R2_paired.fastq.gz /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed/HI.4828.008.NEBNext_Index_9.1-V-620_R2_unpaired.fastq.gz ILLUMINACLIP:/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta:2:30:10 LEADING:28 TRAILING:28 SLIDINGWINDOW:24:28 MINLEN:40

