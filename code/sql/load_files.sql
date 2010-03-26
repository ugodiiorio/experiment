delete from provider_1_sect_1_input_file; load data local infile '/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/prov1_sect1_20100301_in.csv' into table provider_1_sect_1_input_file fields terminated by '#' escaped by "" set pol_provider_company_id_str='all';
delete from companies; load data local infile '/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/companies.csv' into table companies fields terminated by '#' escaped by "";

