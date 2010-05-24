#!/bin/bash
EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ];
then
	echo "Pass two arguments on command line (ie. ./etl_3.sh  sect_1 quixa)"
  	exit $E_BADARGS
else 
	echo @@@ $1 @@@
	echo @@@ $2 @@@
	echo "Starting ..."
	cd /home/notroot/git/KTE/code/builders/etl/3_specific_profile/script
	sed s/"sector_placeholder"/"$1"/g /home/notroot/git/KTE/code/yamls_TW/specific_profile.yml |sed s/"company_placeholder"/"$2"/g |sed s/"company_group_placeholder"/"$2_provider_2"/g   >specific_profile_"$1"_"$2"
	ruby build_specific_profile.rb specific_profile_"$1"_"$2"
	rm specific_profile_"$1"_"$2"
	echo "Finished!"
fi 

