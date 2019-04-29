#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/03_trimmed
DATAOUTPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/05_concatenated

zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_18.1-J-2_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_18.1-J-2_R1_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_18.1-J-2_R1_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_21.1-J-7_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_21.1-J-7_R1_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_21.1-J-7_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_25.1-R-180_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_25.1-R-180_R1_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_25.1-R-180_R1_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_2.1-R-183_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_2.1-R-183_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_2.1-R-183_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_6.1-V-613_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_6.1-V-613_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_6.1-V-613_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_9.1-V-620_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_9.1-V-620_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_9.1-V-620_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_19.2-J-2_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_19.2-J-2_R1_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_19.2-J-2_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_22.2-J-7_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_22.2-J-7_R1_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_22.2-J-7_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_27.2-R-180_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_27.2-R-180_R1_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_27.2-R-180_R1_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_3.2-R-183_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_3.2-R-183_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_3.2-R-183_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_7.2-V-613_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_7.2-V-613_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_7.2-V-613_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_10.2-V-620_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_10.2-V-620_R1_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_10.2-V-620_R1_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_20.3-J-2_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_20.3-J-2_R1_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_20.3-J-2_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_23.3-J-7_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_23.3-J-7_R1_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_23.3-J-7_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_1.3-R-180_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_1.3-R-180_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_1.3-R-180_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_5.3-R-183_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_5.3-R-183_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_5.3-R-183_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_8.3-V-613_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_8.3-V-613_R1_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_8.3-V-613_R1_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_11.3-V-620_R1_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_11.3-V-620_R1_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_11.3-V-620_R1_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_18.1-J-2_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_18.1-J-2_R2_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_18.1-J-2_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_21.1-J-7_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_21.1-J-7_R2_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_21.1-J-7_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_25.1-R-180_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_25.1-R-180_R2_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_25.1-R-180_R2_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_2.1-R-183_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_2.1-R-183_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_2.1-R-183_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_6.1-V-613_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_6.1-V-613_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_6.1-V-613_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_9.1-V-620_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_9.1-V-620_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_9.1-V-620_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_19.2-J-2_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_19.2-J-2_R2_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_19.2-J-2_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_22.2-J-7_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_22.2-J-7_R2_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_22.2-J-7_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_27.2-R-180_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_27.2-R-180_R2_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_27.2-R-180_R2_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_3.2-R-183_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_3.2-R-183_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_3.2-R-183_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_7.2-V-613_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_7.2-V-613_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_7.2-V-613_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_10.2-V-620_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_10.2-V-620_R2_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_10.2-V-620_R2_paired.fastq.gz
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_20.3-J-2_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_20.3-J-2_R2_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_20.3-J-2_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_23.3-J-7_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_23.3-J-7_R2_paired.fastq.gz       | gzip -c >  $DATAOUTPUT/Index_23.3-J-7_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.005.NEBNext_Index_1.3-R-180_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.006.NEBNext_Index_1.3-R-180_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_1.3-R-180_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_5.3-R-183_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_5.3-R-183_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_5.3-R-183_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_8.3-V-613_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_8.3-V-613_R2_paired.fastq.gz     | gzip -c >  $DATAOUTPUT/Index_8.3-V-613_R2_paired.fastq.gz 
zcat $DATADIRECTORY/HI.4828.007.NEBNext_Index_11.3-V-620_R2_paired.fastq.gz $DATADIRECTORY/HI.4828.008.NEBNext_Index_11.3-V-620_R2_paired.fastq.gz   | gzip -c >  $DATAOUTPUT/Index_11.3-V-620_R2_paired.fastq.gz
