#!/bin/bash
EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ];
then
	echo "Pass two arguments on command line (ie. ./etl_1.sh  sect_1 quixa)"
  	exit $E_BADARGS
else
	echo @@@ $1 @@@
	echo @@@ $2 @@@
	echo "Starting ..."
    cd /home/notroot/git/KTE/code/builders/etl/1_generic_profile/script

    # fieldmapping
    mysql -u root -pkub01d --database=kte_driver -e "delete from field_mapping where key_sector_id_str=\""$1"\""
    sed s/"sector_placeholder"/$1/g /home/notroot/git/KTE/code/yamls_TW/field_mapping.yml >field_mapping_"$1"
    ruby build_field_mapping.rb field_mapping_"$1"
    rm field_mapping_"$1"
    

    # profile
    DELETE="delete from insurance_profiles  where key_sector_id_str=\""$1"\" and key_companies_group_id_str=\""$2"_provider_2\""
    mysql -u root -pkub01d --database=kte_driver -e "$DELETE"
    sed s/"sector_placeholder"/"$1"/g /home/notroot/git/KTE/code/yamls_TW/profile.yml |sed s/"company_provider_placeholder"/"$2"/g |sed s/"company_group_placeholder"/""$2"_provider_2"/g >profile_"$1"_"$2"
    ruby build_profile.rb profile_"$1"_"$2"
    rm profile_"$1"_"$2"
	echo "Finished!"
fi
