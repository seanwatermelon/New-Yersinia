New Yersinia
Files Included in the Archive:

1.w22703_four_protein_sequences

Contains protein sequences for four genes in pathogenic island of W22703.

2.input_database

Includes protein sequences for two newly discovered strains of Yersinia.

3.bash_files

3_1. install_bash.sh

Script to download NCBI Blast and LibreOffice on Ubuntu.

3_2. database.sh

Script to generate a database based on existing protein sequences for subsequent retrieval operations.

3_3. perform_blastp.sh

Script to perform a Blast search in Ubuntu system.

3_4. retrieveseq.sh

Script to retrieve sequences based on sequence ID.


How to Start (in Ubuntu sysytem)

1. Install Dependencies: Download NCBI Blast and LibreOffice on Ubuntu.

    bash bash_files/install_bash.sh

2. Generate Database: Create a database using existing protein sequences. The sequences for the database are sourced from the file 'input_database'.

    bash bash_files/database_final.sh

3. Perform Blast Search: Perform a BLAST search with known protein sequences from the file 'w22703_four_protein_sequences' against two databases generated in the previous step. 

    bash bash_files/perform_blastp_final.sh 
	     

4. Retrieve Sequences: Retrieve sequences based on sequence IDs from the Blast results.

    bash_files/retrieveseq_final.sh 

5. Review Outputs:Examine the contents of the output files for the generated results:

5.1 blast_output: Blast search results.

5.2 sequences_output: Retrieved sequences based on Blast results.

