#!/bin/bash

echo "Please enter your fasta file name of your database(Please note: YOUR FILENAME SHOULD NOT HAVE SPACES IN IT!!!):"

##print a message to the console, asking the user to enter the filename of their FASTA database

read database

##read the user's input and stores it in the variable database.

if [ ! -f "$database" ]; then
    echo "error:There is no such file."
    exit 1 
fi

##check if the specified file (database) exists. If the file does not exist, it prints an error message and exits the script with a status code of 1.

makeblastdb -in $database -title $database -dbtype prot -out $database -parse_seqids

## create a BLAST database
##-in $database: Specifies the input FASTA file
##-title $database: Specifies the title of the database
##-dbtype prot: Specifies the database type as protein (use nucl for nucleotide databases)
##-out $database: Specifies the output database filename
##-parse_seqids: Indicates that sequence identifiers should be parsed from the FASTA file

echo "Your "$database" has been output as a database."

##print a message indicating that the database has been successfully created from the specified FASTA file
