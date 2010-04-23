delete from provider_1_sect_1_input_file; load data local infile '/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/prov1_sect1_20100403_in.csv' into table provider_1_sect_1_input_file fields terminated by '#' escaped by "" set pol_provider_company_id_str='all';
delete from companies; load data local infile '/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/companies.csv' into table companies fields terminated by '#' escaped by "";
delete from kte_target.profiles; load data local infile '/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/prov1_profiles.csv' into table kte_target.profiles fields terminated by '#' escaped by "";

