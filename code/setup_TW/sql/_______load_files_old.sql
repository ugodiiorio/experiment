delete from provider_2_sect_1_input_file; load data local infile '/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/prov2_sect1_quixa_20100403_in.csv' into table provider_2_sect_1_input_file fields terminated by '#' escaped by "" ;
delete from companies; load data local infile '/home/notroot/git/KTE/code/builders/etl/1_generic_profile/csv/companies.csv' into table companies fields terminated by '#' escaped by "";

