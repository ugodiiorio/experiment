#!/bin/bash
EXPECTED_ARGS=2
E_BADARGS=65

shift $(($OPTIND -1))

if [ $# -ne $EXPECTED_ARGS ];
then
	echo "Pass two arguments on command line (ie. ./load_single_input.sh  sect_1 quixa)"
  	exit $E_BADARGS
else 
	echo "@@@ Loading "$1" for "$2" @@@"

	LOAD="load data local infile \"/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/prov2_sector_placeholder_company_group_placeholder_20100501_in.csv\" into table provider_2_sector_placeholder_input_file fields terminated by \"#\" escaped by \"\" set pol_provider_company_id_str=\"company_group_placeholder\";"
	STATEMENT=`echo "$LOAD"|sed -e s/"sector_placeholder"/"$1"/g -e s/"company_group_placeholder"/"$2"/g`
	mysql -u root -pkub01d --database=kte_driver -e "$STATEMENT "
fi


