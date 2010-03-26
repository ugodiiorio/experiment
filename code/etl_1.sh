cd /home/notroot/git/KTE/code/builders/etl/1_generic_profile/script
# mysql -u root -pkub01d --database=kte_driver -e "delete from field_mapping"
ruby build_field_mapping.rb /home/notroot/git/KTE/code/yamls/field_mapping.yml
# mysql -u root -pkub01d --database=kte_driver -e "delete from insurance_profiles"
ruby build_profile.rb /home/notroot/git/KTE/code/yamls/profile.yml

