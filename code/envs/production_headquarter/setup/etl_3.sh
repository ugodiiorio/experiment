#!/bin/bash
if [ $1 -eq  ]; then
	echo "Pass the yaml file name on command line argument (ie. ./etl_3.sh quixa)"
else 
	echo @@@ $1 @@@
	echo "Starting ..."
	yml="/home/notroot/git/KTE/code/yamls_TW/specific_profile_"$1".yml"
	echo @@@ $yml @@@
	cd /home/notroot/git/KTE/code/builders/etl/3_specific_profile/script
	ruby build_specific_profile.rb $yml
	echo "Finished!"
fi 

