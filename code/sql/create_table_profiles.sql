CREATE TABLE  `kte_target`.`profiles` (
  `key_profile_id_str` varchar(32) collate latin1_general_ci NOT NULL,
  `technical_profile_id_str` char(2) collate latin1_general_ci NOT NULL,
  `counter_id_num` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`key_profile_id_str`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci
