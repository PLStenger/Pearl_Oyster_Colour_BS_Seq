#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


WORKING_DIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo

cd $WORKING_DIRECTORY

unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/*.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
