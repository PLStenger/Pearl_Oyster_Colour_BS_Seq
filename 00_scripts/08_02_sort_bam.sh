#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/06_bismark
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"

$SAMTOOLS_ENV
cd $DATADIRECTORY

for FILE in $(ls $DATADIRECTORY/*deduplicated.bam)

do

$SAMTOOLS sort ${FILE##*/} > ${FILE##*/}_sorted.bam

done;

