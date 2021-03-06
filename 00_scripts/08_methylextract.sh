#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


GENOME=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome/sspace.final.scaffolds.fasta
BAM=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark

OUTPUT=/home1/scratch/plstenge/methylextract_result

#METHYLEXTRACT_ENV=". /appli/bioinfo/methylextract/1.9.1/env.sh" #version 1.9.1
METHYLEXTRACT_ENV=/home1/datawork/plstenge/96_env_conda/methylextract/MethylExtract.pl

NCPU=4

cd $BAM

$METHYLEXTRACT_ENV

#perl $METHYLEXTRACT_ENV seq=$GENOME inDir=$BAM/Index_10.2-V-620_R1_paired_bismark_bt2_pe.bam minQ=30 varFraction=0.05 maxPval=0.01 flagW=99,147 flagC=83,163 bedOut=Y outDir=$OUTPUT
perl $METHYLEXTRACT_ENV seq=$GENOME inDir=$BAM minQ=25 varFraction=0.05 maxPval=0.05 flagW=99,147 flagC=83,163 bedOut=Y outDir=$OUTPUT
#pattern=ALL
