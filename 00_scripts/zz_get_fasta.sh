#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_genome

# https://bedtools.readthedocs.io/en/latest/content/tools/getfasta.html

BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh"

$BEDTOOLS_ENV

cd $DATADIRECTORY

bedtools getfasta -fi sspace.final.scaffolds_02.fasta -bed Real_genes_with_intron_length_02.bed -name -tab > Real_genes_with_intron_length.fasta


