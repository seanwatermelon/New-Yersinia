#!/bin/bash

##user input for the database name

echo "Please input the name of your database:"

##the input is stored in the variable database

read database

##check if the database file exists

if [ ! -f "$database" ]; then

    echo "Error: There is no such file."

    exit 1

fi

##infinite loop for querying sequences

while true; do

    echo "Please input query sequence ID number:"

    read id_num

    echo "Here is your query sequence results:"

    grep -A 1 "$id_num" "$database"

##search for and display the lines containing the specified ID in the database

##save query sequence results to a file

    while true; do

        read -p "Do you want to save your query sequence results to a file? [Y/N]" user_input

        user_input_lower=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

##The user's input is converted to lowercase using tr (translate) command

        if [ "$user_input_lower" = "yes" ] || [ "$user_input_lower" = "y" ]; then

            read -p "Please input the file name:" output_file

            grep -A 1 "$id_num" "$database" >> "$output_file"

##appends the query sequence results to the specified file

            break

        elif [ "$user_input_lower" = "no" ] || [ "$user_input_lower" = "n" ]; then

            break

        else

            echo "Invalid input, please input Yes or No."

        fi

    done

##search for another query sequence

    while true; do

        read -p "Do you want to search for another query sequence in the same database? [Y/N]" search_another

        search_another_lower=$(echo "$search_another" | tr '[:upper:]' '[:lower:]')

        if [ "$search_another_lower" = "yes" ] || [ "$search_another_lower" = "y" ]; then

            break

        elif [ "$search_another_lower" = "no" ] || [ "$search_another_lower" = "n" ]; then

            exit

        else

            echo "Invalid input, please input Yes or No."

        fi

##ensures that the user is given the option to search for another query sequence in the same database

    done

done

