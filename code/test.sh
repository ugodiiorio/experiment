cd /home/notroot/git/KTE/code/builders/etl/2_translation_rule/script
# mysql -u root -pkub01d --database=kte_driver -e "delete from translation_rules"
ruby build_translation_rules.rb /home/notroot/git/KTE/code/yamls/translation_rule.yml
# mysql -u root -pkub01d --database=kte_driver -e "delete from translated_fields"
ruby build_translated_fields.rb /home/notroot/git/KTE/code/yamls/translated_field.yml

