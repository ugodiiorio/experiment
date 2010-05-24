cd /home/notroot/git/KTE/code/builders/schemas/script
mysql -u root -pkub01d -e "drop schema kte_monitor"
ruby start_build.rb /home/notroot/git/KTE/code/yamls_TW/monitor_schema.yml
mysql -u root -pkub01d -e "drop schema kte_target"
ruby start_build.rb /home/notroot/git/KTE/code/yamls_TW/target_schema.yml
mysql -u root -pkub01d -e "drop schema kte_driver"
ruby start_build.rb /home/notroot/git/KTE/code/yamls_TW/driver_schema.yml
cd /home/notroot/git/KTE/code
mysql -u root -pkub01d --database=kte_driver --batch < /home/notroot/git/KTE/code/builders/schemas/sql/create_view_sect_1.sql
mysql -u root -pkub01d --database=kte_driver --batch < /home/notroot/git/KTE/code/builders/schemas/sql/create_view_sect_2.sql
mysql -u root -pkub01d --database=kte_driver --batch < /home/notroot/git/KTE/code/builders/schemas/sql/create_view_sect_3.sql
mysql -u root -pkub01d --database=kte_driver --batch < /home/notroot/git/KTE/code/builders/schemas/sql/create_view_sect_4.sql
mysql -u root -pkub01d --database=kte_driver --batch < ./sql/create_table_profiles.sql
mysql -u root -pkub01d --database=kte_driver --batch < ./sql/load_files.sql
mysql -u root -pkub01d --database=kte_driver -e "delete from profiles_personal_data"
mysql -u root -pkub01d --database=kte_driver --batch < /home/notroot/git/KTE/code/builders/etl/1_generic_profile/sql/insert_anagrafica.sql

