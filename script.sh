#!/bin/bash
#usage: bash script.sh <virus_genome_file>

#read virus_genome_file as a command line argument
genome=$1

#run CrisprOpenDB host prediction with 2 mismatches and 8 cores/cpus
result=`python CL_Interface.py -i $genome -m 2 -n 8`

#The current output of CrisprOpenDB is in the form of Python tuple
if grep -q "(" <(echo $result) ; then

genome_id=`echo $result | awk -F "[()',]" '{print $3}' | xargs`
host=`echo $result | awk -F "[()',]" '{print $6}' | xargs`
criterion=`echo $result | awk -F "[()',]" '{print $8}' | xargs`

#for some genomes the output is just No hits found without the usual tuple format and without genome_id, so extract genome_id for these genomes
else

genome_id=`awk '/^>/{print substr($0,2)}' $genome`

fi

if ! grep -q "No hits found" <(echo $result) ; then

#extract lineage
lineage=`awk -v host="$host" -F',' '{for(i=1;i<=NF;i++){if($i==host){print $0; exit;i++}}}' ncbi_lineages_2022-06-19.csv`

#merge results, the output will be in csv format
paste -d',' <(echo $genome_id) <(echo $host) <(echo $criterion) <(echo $lineage)

else

paste -d ',' <(echo $genome_id) <(echo "No hits found") <(echo "None")

fi
