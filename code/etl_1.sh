if [ "$1" = "" ]; then
	echo "Pass the provider code on command line argument (code 1 for provider 1 - code 2 for provider 2)"
else 
	cd /home/notroot/git/KTE/code/builders/etl/1_generic_profile/script
	# mysql -u root -pkub01d --database=kte_driver -e "delete from field_mapping"
	ruby build_field_mapping.rb /home/notroot/git/KTE/code/yamls/field_mapping_"$1".yml
	# mysql -u root -pkub01d --database=kte_driver -e "delete from insurance_profiles"
	ruby build_profile.rb /home/notroot/git/KTE/code/yamls/profile_"$1".yml
fi 

