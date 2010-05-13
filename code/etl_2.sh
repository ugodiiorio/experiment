if [ "$1" = "" ]; then
	echo "Pass the provider code on command line argument (code 1 for provider 1 - code 2 for provider 2)"
else 
	cd /home/notroot/git/KTE/code/builders/etl/2_translation_rule/script
	# mysql -u root -pkub01d --database=kte_driver -e "delete from translation_rules"
	ruby build_translation_rules.rb /home/notroot/git/KTE/code/yamls/translation_rule_"$1".yml
	# mysql -u root -pkub01d --database=kte_driver -e "delete from translated_fields"
	ruby build_translated_fields.rb /home/notroot/git/KTE/code/yamls/translated_field_"$1".yml
fi

