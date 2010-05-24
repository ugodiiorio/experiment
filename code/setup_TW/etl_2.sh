#!/bin/bash
EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ];
then
	echo "Pass two arguments on command line (ie. ./etl_2.sh  sect_1 quixa)"
  	exit $E_BADARGS
else 
	echo @@@ $1 @@@
	echo @@@ $2 @@@
	echo "Starting ..."

	cd /home/notroot/git/KTE/code/builders/etl/2_translation_rule/script
	
	#rules
	#mysql -u root -pkub01d --database=kte_driver -e "delete from translation_rules"
	sed s/"sector_placeholder"/"$1"/g /home/notroot/git/KTE/code/yamls_TW/translation_rule.yml |sed s/"company_placeholder"/"$2"/g >translation_rule_"$1"_"$2"
	ruby build_translation_rules.rb translation_rule_"$1"_"$2"
	rm translation_rule_"$1"_"$2"

	#fields
	#mysql -u root -pkub01d --database=kte_driver -e "delete from translated_fields"
	sed s/"sector_placeholder"/"$1"/g /home/notroot/git/KTE/code/yamls_TW/translated_field.yml |sed s/"company_placeholder"/"$2"/g |sed s/"company_group_placeholder"/"$2_provider_2"/g >translated_field_"$1"_"$2"
	ruby build_translated_fields.rb translated_field_"$1"_"$2"
	rm translated_field_"$1"_"$2"
	echo "Finished!"
fi 

