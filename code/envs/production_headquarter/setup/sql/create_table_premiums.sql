CREATE TABLE  `kte_target`.`premiums` (
  `key_insurance_profiles_id_num` int(5) unsigned NOT NULL,
  `key_provider_id_str` varchar(20) collate latin1_general_ci NOT NULL,
  `key_sector_id_str` varchar(20) collate latin1_general_ci NOT NULL,
  `key_company_id_str` varchar(20) collate latin1_general_ci NOT NULL,
  `key_working_set_id_str` varchar(20) collate latin1_general_ci NOT NULL,
  `key_rate_id_str` varchar(8) collate latin1_general_ci NOT NULL,
  `key_cover_id_str` varchar(20) collate latin1_general_ci NOT NULL,
  `record_id_str` varchar(32) collate latin1_general_ci NOT NULL,
  `premium_num` decimal(6,2) NOT NULL,
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`key_insurance_profiles_id_num`,`key_provider_id_str`,`key_sector_id_str`,`key_company_id_str`,`key_working_set_id_str`,`key_rate_id_str`,`key_cover_id_str`),
  KEY `profile_fk_constraint` (`record_id_str`),
  CONSTRAINT `profile_fk_constraint` FOREIGN KEY (`record_id_str`) REFERENCES `profiles` (`key_profile_id_str`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci
