#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


WORKING_DIRECTORY=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo

cd $WORKING_DIRECTORY

unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/121650488_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1402495369.zip    -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/141159676_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1426144759.zip    -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1455727354_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1534427251_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1610325698_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1631529138.zip    -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1671660742ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1681165661ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1758280549_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1850570871.zip    -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1928815231-ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/1995960986_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/2013740170_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/2024808167ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/2026968535_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/2123636743_ok.zip -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/27271919.zip      -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/356288353_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/388679182_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/465506777_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/483125216_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/525174637_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/542458638_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/590242080.zip     -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/613912080_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/754149042_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/
unzip /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo/778664133_ok.zip  -d /home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/BS_seq_yoyo_unzip/

