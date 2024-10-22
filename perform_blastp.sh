#!/bin/bash

##The user is prompted to input the fileame of the query sequence in FASTA format, and the input is stored in the variable query_seq

echo "Please input the fasta file name of your query sequence:"

read query_seq

##check if the query sequence file exists

if [ ! -f "$query_seq" ]; then

    echo "Error: There is no such file."

    exit 1
fi

##loop until a valid database file is provided

while true; do

    echo "Please input the fasta file name of your database:"

    read database_name

    if [ -f "$database_name" ]; then

        break

    else

        echo "Error: There is no such file."
    fi
done

echo "Please name your result file:"

read result

##loop until correct format for the expected E-value is provided

while true; do

    read -p "Please input expecting e-value for the blast analysis (e.g., 1e-30):" evalue

    if [[ $evalue =~ ^[+]?[0-9]+[eE][+-]?[0-9]+$ ]]; then

        break

    else

        echo "Warning: The e-value format is not correct, please retry."
    fi

done

while true; do

    blastp -query "$query_seq" -db "$database_name" -out "$result" -evalue "$evalue" -outfmt 6

    if [ -s "$result" ]; then

## Insert the header into the CSV file

        sed '1i\query acc.ver,subject acc.ver,% identity,alignment length,mismatches,gap opens,q. start,q. end,s. start,s. end,e-value,bit score' "$result" > result1.txt

## Replace tabs with commas and save as a CSV file

        sed 's/\t/,/g' result1.txt > "$result.csv"

## Remove temporary file

        rm result1.txt

	rm $result

        echo "Your result has already been output."

        break

    else

        echo "Warning: No results were found for the specified e-value. Please consider adjusting the e-value and try again."

        read -p "Do you want to search with a different e-value? (Y/N): " user_input

	user_input_lower=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

        if [ "$user_input_lower" != "yes" ] && [ "$user_input_lower" != "y" ]; then

		break

    	fi
	
	while true; do
		
		read -p "Please input expecting e-value for the blast analysis (e.g.,1e-30):" evalue

		if [[ $evalue =~ ^[+]?[0-9]+[eE][+-]?[0-9]+$ ]]; then
            
			break
		
		else
			echo "Warning: The e-value format is not correct, please retry."

		fi
	done
    fi

done
