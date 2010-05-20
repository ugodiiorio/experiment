#!/bin/bash
if [ $1 -eq  ]; then
	echo "Pass the yaml file name on command line argument (ie. ./etl_2.sh quixa)"
else 
	echo @@@ $1 @@@
	echo "Starting ..."
	yml1="/home/test/kte/yamls/translation_rule_"$1".yml"
	echo @@@ $yml1 @@@
	yml2="/home/test/kte/yamls/translated_field_"$1".yml"
	echo @@@ $yml2 @@@
	cd /home/test/kte/builders/etl/2_translation_rule/script
	# mysql -u root -pkub01d --database=kte_driver -e "delete from translation_rules"
	ruby build_translation_rules.rb $yml1
	# mysql -u root -pkub01d --database=kte_driver -e "delete from translated_fields"
	ruby build_translated_fields.rb $yml2
	echo "Finished!"
fi 

