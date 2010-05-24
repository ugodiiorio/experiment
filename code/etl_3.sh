if [ "$1" = "" ]; then
	echo "Pass the provider code on command line argument (code 1 for provider 1 - code 2 for provider 2)"
else 
	cd /home/notroot/git/KTE/code/builders/etl/3_specific_profile/script
	ruby build_specific_profile.rb /home/notroot/git/KTE/code/yamls/specific_profile_"$1".yml
fi
