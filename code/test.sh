#!/bin/bash
cd /home/notroot/git/KTE/code/builders/etl/1_generic_profile/script
if [ "$1" = "" ]; then
	echo "Pass y or n if you want delete or not the mysql tables (ie. ./etl_1.sh y n)"
else
	if [ "$2" = "" ]; then
		echo "Pass y or n if you want delete or not the mysql tables (ie. ./etl_1.sh y n)"
	else
		if [ "$1" = "y" ]; then
			echo @@@ $1 @@@
			echo "Starting ..."
			echo "delete table field_mapping"
			mysql -u root -pkub01d --database=kte_driver -e "delete from field_mapping"
			ruby build_field_mapping.rb /home/notroot/git/KTE/code/yamls_TW/field_mapping.yml
			if [ "$2" = "y" ]; then
				echo @@@ $2 @@@
				echo "Starting ..."
				echo "delete table insurance_profiles"
				mysql -u root -pkub01d --database=kte_driver -e "delete from insurance_profiles"
				ruby build_profile.rb /home/notroot/git/KTE/code/yamls_TW/profile.yml
			else
				echo @@@ $2 @@@
				echo "Starting ..."
				echo "NOT delete table insurance_profiles"
				ruby build_profile.rb /home/notroot/git/KTE/code/yamls_TW/profile.yml
			fi
		else
			echo @@@ $1 @@@
			echo "Starting ..."
			echo "NOT delete table field mapping"
			ruby build_field_mapping.rb /home/notroot/git/KTE/code/yamls_TW/field_mapping.yml
			if [ "$2" = "y" ]; then
				echo @@@ $2 @@@
				echo "Starting ..."
				echo "delete table insurance_profiles"
				mysql -u root -pkub01d --database=kte_driver -e "delete from insurance_profiles"
				ruby build_profile.rb /home/notroot/git/KTE/code/yamls_TW/profile.yml
			else
				echo @@@ $2 @@@
				echo "Starting ..."
				echo "NOT delete table insurance_profiles"
				ruby build_profile.rb /home/notroot/git/KTE/code/yamls_TW/profile.yml
			fi
		fi
	fi
fi
