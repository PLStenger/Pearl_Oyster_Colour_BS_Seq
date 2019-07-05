#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

BLAST_PROGRAM=blastx
ALIGNMENTS=3
BLAST_PARAM="-evalue 1e-3"
BANK=/home/ref-bioinfo/beedeem/p/NCBI_nr/current/NCBI_nr/NCBI_nr



#QUERY1=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/interest_q0_05.fasta
#QUERY1=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/q0_05last.fasta
QUERY1=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/01_data/q0_05_controls.fasta
OUT_FILE1=q0_05_controls_result_blast.txt


# Activation de l'environnement BLAST+ 2.6.0
. /appli/bioinfo/blast/2.6.0/env.sh

# ------------------------------------------------------------------------------

CB_NAME=$(basename $PBS_JOBNAME)
CB_TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
CB_LOG_FOLDER=/home/datawork-ihpe/Pearl_Oyster_Colour_BS_Seq/10_blast/"$CB_TIMESTAMP"_"$CB_NAME"
mkdir -p $CB_LOG_FOLDER
cp $0 $CB_LOG_FOLDER/$CB_NAME


# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive1.asn1
${BLAST_PROGRAM} -query "${QUERY1}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE1} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"
