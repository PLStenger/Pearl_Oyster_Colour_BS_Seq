#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation
GFF=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation/sspace.final.scaffolds_no_pipe_size.gff3
INPUT=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/09_annotation/Inversed_3V620_3J2_Diffmeth.norm_all_control_color_against_all_treatment_color_time_1_diff25.q0.001.hyper.txt
BEDTOOLS_ENV=". /appli/bioinfo/bedtools/2.26.0/env.sh"

# https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html

cd $DATADIRECTORY

$BEDTOOLS_ENV

bedtools intersect -a $GFF -b $INPUT > output_test.txt

