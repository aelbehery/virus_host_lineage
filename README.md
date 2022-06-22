# virus_host_lineage
## Description
Use CrisprOpenDB to detect viral host then extract host lineage from NCBI taxonomy.
## Requirements

 - [**CrisprOpenDB**](https://github.com/edzuf/CrisprOpenDB)
 - **ncbi_lineages_xxxx-xx-xx.csv**: this file contains NCBI taxonomy lineages prepared using [ncbitax2lin](https://github.com/zyxue/ncbitax2lin).
## Usage
 - Copy script.sh to the same directory that contains CrisprOpenDB   
   installation.
 - Use tax2lin to create a new ncbi lineage file in the same directory. 
 - Edit script.sh to rename ncbi_lineages_2022-06-19.csv to the name   
   that matches the file you created using ncbitax2lin.
 - Run script.sh:
 `bash script.sh <virus_genome_file>`
 ## Output
 The output is in csv format. The first three columns are genome_id, predicted_host and CrisprOpenDB_criterion_for_prediction, respectively. The rest of columns represent the taxonomic lineage of the predicted host, starting with taxid, kingdom, phylum, class, order, family, genus etc.

If there is no hit found, only the first three columns will be generated, containing genome_id, no hits found and None.
## Example

    bash script.sh TestGenomes/AY133112.fasta
AY133112.1,Vibrio,2,662,Bacteria,Proteobacteria,Gammaproteobacteria,Vibrionales,Vibrionaceae,Vibrio,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,cellular organisms,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
