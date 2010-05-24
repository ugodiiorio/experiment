#!/bin/bash

EXPECTED_ARGS=2
E_BADARGS=65




while getopts d:h flag 
do
case "$flag" in 
	d)	
		echo @@@ Deleting $OPTARG @@@
		DELETE="delete from provider_2_sector_placeholder_input_file;"
		STATEMENT=`echo "$DELETE"|sed -e s/"sector_placeholder"/"$OPTARG"/g`
		mysql -u root -pkub01d --database=kte_driver -e "$STATEMENT"
	;;

	h) 	echo "Usage:"
		echo "Use the script in two possible way" 
		echo "1) to delete all the input for one or more sectors ( ex for sect_1: ./load_single_input.sh -d sect_1)"
		echo "2) to load a company input for a given sector ( ex quixa input for sect_1: ./load_single_input.sh sect_1 quixa)"
		exit 0	
	;;
	*) 	
		echo "$#"
		echo "Option not supported please check help page"
		echo "./load_single_input.sh -h " 
		exit 0
	
	;;
esac
done	







