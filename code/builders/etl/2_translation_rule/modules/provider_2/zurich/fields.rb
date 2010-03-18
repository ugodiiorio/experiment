module Provider2Zurich

  def build_hash_sect_1()

    @target_values = {}

    @target_values = {
      {'veh_fuel_str' => 'B'} => 'COD_TCMB_B',
      {'veh_fuel_str' => 'D'} => 'COD_TCMB_D',
      {'veh_fuel_str' => 'G'} => 'COD_TCMB_G',
      {'veh_fuel_str' => 'M'} => 'COD_TCMB_M',
      {'pol_risk_certificate_str' => 'si'} => 'Scaduto da meno di 5 anni',
      {'pol_BM_assigned_str' => '-1'} => '01',
      {'pol_BM_assigned_str' => '1'} => '02',
      {'pol_BM_assigned_str' => '2'} => '03',
      {'pol_BM_assigned_str' => '3'} => '04',
      {'pol_BM_assigned_str' => '4'} => '05',
      {'pol_BM_assigned_str' => '5'} => '06',
      {'pol_BM_assigned_str' => '6'} => '07',
      {'pol_BM_assigned_str' => '7'} => '08',
      {'pol_BM_assigned_str' => '8'} => '09',
      {'pol_BM_assigned_str' => '9'} => '10',
      {'pol_BM_assigned_str' => '10'} => '11',
      {'pol_BM_assigned_str' => '11'} => '12',
      {'pol_BM_assigned_str' => '12'} => '13',
      {'pol_BM_assigned_str' => '13'} => '14',
      {'pol_BM_assigned_str' => '14'} => '15',
      {'pol_BM_assigned_str' => '15'} => '16',
      {'pol_BM_assigned_str' => '16'} => '17',
      {'pol_BM_assigned_str' => '17'} => '18',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'driv_heir_str' => 'no'} => 'CLA_ERLE_N',
      {'veh_tow_hook_str' => 'no'} => 'CODVER23_N',
      {'pol_defined_drive_str' => 'si'} => 'GUI_DEFINI_S',
      {'pol_defined_drive_str' => 'no'} => 'GUI_DEFINI_N',
      {'pol_exclusive_drive_str' => 'si'} => 'GUI_ESCLUS_S',
      {'pol_exclusive_drive_str' => 'no'} => 'GUI_ESCLUS_N',
      {'pol_free_drive_str' => 'si'} => 'GUI_LIBERA_S',
      {'pol_free_drive_str' => 'no'} => 'GUI_LIBERA_N',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '26.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '18,000,000'} => '15.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000000'} => '6.000.000 EURO',
      {'own_owner_sex_str' => 'M'} => 'COD_SESS_M',
      {'own_owner_sex_str' => 'F'} => 'COD_SESS_F',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_type_of_contract_str' => 'bonus/malus'} => 'BONUS MALUS',
      {'pol_quotation_str' => 'bonus/malus'} => 'COD_TMOV_N',
      {'own_owner_specification_str' => 'M'} => 'TIP_PERS_F',
      {'own_owner_specification_str' => 'F'} => 'TIP_PERS_F',
      {'own_owner_specification_str' => 'C'} => 'TIP_PERS_G',
      {'pol_property_type_to_be_insured_str' => 'autovettura'} => 'AUTOVETTURA SERVIZIO PRIVATO',
      {'veh_vehicle_type_str' => 'autovettura'} => 'AUTOVETTURA',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',

    }

  end
   
  def build_hash_sect_2()

    @target_values = {}

    @target_values = {

      {'driv_heir_str' => 'no',} => '//*[@id="CLA_ERLE_N"]',
      {'own_owner_sex_str' => 'M'} => '//*[@id="COD_SESS_M"]',
      {'own_owner_sex_str' => 'F'} => '//*[@id="COD_SESS_F"]',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '01',
      {'pol_BM_assigned_str' => '1'} => '01',
      {'pol_BM_assigned_str' => '2'} => '02',
      {'pol_BM_assigned_str' => '3'} => '03',
      {'pol_BM_assigned_str' => '4'} => '04',
      {'pol_BM_assigned_str' => '5'} => '05',
      {'pol_BM_assigned_str' => '6'} => '06',
      {'pol_BM_assigned_str' => '7'} => '07',
      {'pol_BM_assigned_str' => '8'} => '08',
      {'pol_BM_assigned_str' => '9'} => '09',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_client_type_str' => 'persona fisica'} => '//*[@id="TIP_PERS_F"]',
      {'pol_client_type_str' => 'persona giuridica'} => '//*[@id="TIP_PERS_G"]',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_privacy_1_str' => 'id elemento web1'} => '//*[@id="check1"]',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '26.000.000 EURO',
      {'pol_quotation_str' => 'BM'} => 'BONUS MALUS',
      {'pol_quotation_str' => 'fissa'} => 'BONUS MALUS',
      {'pol_quotation_str' => 'franchigia'} => 'BONUS MALUS',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'pol_residence_province_str' => 'AG'} => 'AGRIGENTO',
      {'pol_residence_province_str' => 'AL'} => 'ALESSANDRIA',
      {'pol_residence_province_str' => 'AN'} => 'ANCONA',
      {'pol_residence_province_str' => 'AO'} => 'AOSTA',
      {'pol_residence_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'pol_residence_province_str' => 'AQ'} => 'L\' AQUILA',
      {'pol_residence_province_str' => 'AR'} => 'AREZZO',
      {'pol_residence_province_str' => 'AT'} => 'ASTI',
      {'pol_residence_province_str' => 'AV'} => 'AVELLINO',
      {'pol_residence_province_str' => 'BA'} => 'BARI',
      {'pol_residence_province_str' => 'BG'} => 'BERGAMO',
      {'pol_residence_province_str' => 'BI'} => 'BIELLA',
      {'pol_residence_province_str' => 'BL'} => 'BELLUNO',
      {'pol_residence_province_str' => 'BN'} => 'BENEVENTO',
      {'pol_residence_province_str' => 'BO'} => 'BOLOGNA',
      {'pol_residence_province_str' => 'BR'} => 'BRINDISI',
      {'pol_residence_province_str' => 'BS'} => 'BRESCIA',
      {'pol_residence_province_str' => 'BT'} => 'BARLETTA ANDRIA TRANI',
      {'pol_residence_province_str' => 'BZ'} => 'BOLZANO',
      {'pol_residence_province_str' => 'CA'} => 'CAGLIARI',
      {'pol_residence_province_str' => 'CB'} => 'CAMPOBASSO',
      {'pol_residence_province_str' => 'CE'} => 'CASERTA',
      {'pol_residence_province_str' => 'CH'} => 'CHIETI',
      {'pol_residence_province_str' => 'CI'} => 'CARBONIA IGLESIAS',
      {'pol_residence_province_str' => 'CL'} => 'CALTANISSETTA',
      {'pol_residence_province_str' => 'CN'} => 'CUNEO',
      {'pol_residence_province_str' => 'CO'} => 'COMO',
      {'pol_residence_province_str' => 'CR'} => 'CREMONA',
      {'pol_residence_province_str' => 'CS'} => 'COSENZA',
      {'pol_residence_province_str' => 'CT'} => 'CATANIA',
      {'pol_residence_province_str' => 'CZ'} => 'CATANZARO',
      {'pol_residence_province_str' => 'EN'} => 'ENNA',
      {'pol_residence_province_str' => 'FC'} => 'FORLI\' E CESENA',
      {'pol_residence_province_str' => 'FE'} => 'FERRARA',
      {'pol_residence_province_str' => 'FG'} => 'FOGGIA',
      {'pol_residence_province_str' => 'FI'} => 'FIRENZE',
      {'pol_residence_province_str' => 'FM'} => 'FERMO',
      {'pol_residence_province_str' => 'FR'} => 'FROSINONE',
      {'pol_residence_province_str' => 'GE'} => 'GENOVA',
      {'pol_residence_province_str' => 'GO'} => 'GORIZIA',
      {'pol_residence_province_str' => 'GR'} => 'GROSSETO',
      {'pol_residence_province_str' => 'IM'} => 'IMPERIA',
      {'pol_residence_province_str' => 'IS'} => 'ISERNIA',
      {'pol_residence_province_str' => 'KR'} => 'CROTONE',
      {'pol_residence_province_str' => 'LC'} => 'LECCO',
      {'pol_residence_province_str' => 'LE'} => 'LECCE',
      {'pol_residence_province_str' => 'LI'} => 'LIVORNO',
      {'pol_residence_province_str' => 'LO'} => 'LODI',
      {'pol_residence_province_str' => 'LT'} => 'LATINA',
      {'pol_residence_province_str' => 'LU'} => 'LUCCA',
      {'pol_residence_province_str' => 'MB'} => 'MONZA BRIANZA',
      {'pol_residence_province_str' => 'MC'} => 'MACERATA',
      {'pol_residence_province_str' => 'ME'} => 'MESSINA',
      {'pol_residence_province_str' => 'MI'} => 'MILANO',
      {'pol_residence_province_str' => 'MN'} => 'MANTOVA',
      {'pol_residence_province_str' => 'MO'} => 'MODENA',
      {'pol_residence_province_str' => 'MS'} => 'MASSA CARRARA',
      {'pol_residence_province_str' => 'MT'} => 'MATERA',
      {'pol_residence_province_str' => 'NA'} => 'NAPOLI',
      {'pol_residence_province_str' => 'NO'} => 'NOVARA',
      {'pol_residence_province_str' => 'NU'} => 'NUORO',
      {'pol_residence_province_str' => 'OG'} => 'OGLIASTRA',
      {'pol_residence_province_str' => 'OR'} => 'ORISTANO',
      {'pol_residence_province_str' => 'OT'} => 'OLBIA TEMPIO',
      {'pol_residence_province_str' => 'PA'} => 'PALERMO',
      {'pol_residence_province_str' => 'PC'} => 'PIACENZA',
      {'pol_residence_province_str' => 'PD'} => 'PADOVA',
      {'pol_residence_province_str' => 'PE'} => 'PESCARA',
      {'pol_residence_province_str' => 'PG'} => 'PERUGIA',
      {'pol_residence_province_str' => 'PI'} => 'PISA',
      {'pol_residence_province_str' => 'PN'} => 'PORDENONE',
      {'pol_residence_province_str' => 'PO'} => 'PRATO',
      {'pol_residence_province_str' => 'PR'} => 'PARMA',
      {'pol_residence_province_str' => 'PT'} => 'PISTOIA',
      {'pol_residence_province_str' => 'PU'} => 'PESARO E URBINO',
      {'pol_residence_province_str' => 'PV'} => 'PAVIA',
      {'pol_residence_province_str' => 'PZ'} => 'POTENZA',
      {'pol_residence_province_str' => 'RA'} => 'RAVENNA',
      {'pol_residence_province_str' => 'RC'} => 'REGGIO CALABRIA',
      {'pol_residence_province_str' => 'RE'} => 'REGGIO EMILIA',
      {'pol_residence_province_str' => 'RG'} => 'RAGUSA',
      {'pol_residence_province_str' => 'RI'} => 'RIETI',
      {'pol_residence_province_str' => 'RM'} => 'ROMA',
      {'pol_residence_province_str' => 'RN'} => 'RIMINI',
      {'pol_residence_province_str' => 'RO'} => 'ROVIGO',
      {'pol_residence_province_str' => 'SA'} => 'SALERNO',
      {'pol_residence_province_str' => 'SI'} => 'SIENA',
      {'pol_residence_province_str' => 'SO'} => 'SONDRIO',
      {'pol_residence_province_str' => 'SP'} => 'LA SPEZIA',
      {'pol_residence_province_str' => 'SR'} => 'SIRACUSA',
      {'pol_residence_province_str' => 'SS'} => 'SASSARI',
      {'pol_residence_province_str' => 'SV'} => 'SAVONA',
      {'pol_residence_province_str' => 'TA'} => 'TARANTO',
      {'pol_residence_province_str' => 'TE'} => 'TERAMO',
      {'pol_residence_province_str' => 'TN'} => 'TRENTO',
      {'pol_residence_province_str' => 'TO'} => 'TORINO',
      {'pol_residence_province_str' => 'TP'} => 'TRAPANI',
      {'pol_residence_province_str' => 'TR'} => 'TERNI',
      {'pol_residence_province_str' => 'TS'} => 'TRIESTE',
      {'pol_residence_province_str' => 'TV'} => 'TREVISO',
      {'pol_residence_province_str' => 'UD'} => 'UDINE',
      {'pol_residence_province_str' => 'VA'} => 'VARESE',
      {'pol_residence_province_str' => 'VB'} => 'VERBANIA',
      {'pol_residence_province_str' => 'VC'} => 'VERCELLI',
      {'pol_residence_province_str' => 'VE'} => 'VENEZIA',
      {'pol_residence_province_str' => 'VI'} => 'VICENZA',
      {'pol_residence_province_str' => 'VR'} => 'VERONA',
      {'pol_residence_province_str' => 'VS'} => 'MEDIO CAMPIDANO',
      {'pol_residence_province_str' => 'VT'} => 'VITERBO',
      {'pol_residence_province_str' => 'VV'} => 'VIBO VALENTIA',
      {'pol_type_of_contract_str' => 'nuova polizza'} => '[@id="COD_TMOV_N"]',
      {'veh_fuel_str' => 'benzina'} => '//*[@id="COD_TCMB_B"]',
      {'veh_vehicle_type_str' => 'motociclo'} => 'MOTOCICLO USO PRIVATO',

    }

  end

  def build_hash_sect_3()

    @target_values = {}

    @target_values = {

      {'driv_heir_str' => 'no',} => '//*[@id="CLA_ERLE_N"]',
      {'own_owner_sex_str' => 'M'} => '//*[@id="COD_SESS_M"]',
      {'own_owner_sex_str' => 'F'} => '//*[@id="COD_SESS_F"]',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '01',
      {'pol_BM_assigned_str' => '1'} => '01',
      {'pol_BM_assigned_str' => '2'} => '02',
      {'pol_BM_assigned_str' => '3'} => '03',
      {'pol_BM_assigned_str' => '4'} => '04',
      {'pol_BM_assigned_str' => '5'} => '05',
      {'pol_BM_assigned_str' => '6'} => '06',
      {'pol_BM_assigned_str' => '7'} => '07',
      {'pol_BM_assigned_str' => '8'} => '08',
      {'pol_BM_assigned_str' => '9'} => '09',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_client_type_str' => 'persona fisica'} => '//*[@id="TIP_PERS_F"]',
      {'pol_client_type_str' => 'persona giuridica'} => '//*[@id="TIP_PERS_G"]',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_privacy_1_str' => 'si'} => '//*[@id="check1"]',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '26.000.000 EURO',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'pol_residence_province_str' => 'AG'} => 'AGRIGENTO',
      {'pol_residence_province_str' => 'AL'} => 'ALESSANDRIA',
      {'pol_residence_province_str' => 'AN'} => 'ANCONA',
      {'pol_residence_province_str' => 'AO'} => 'AOSTA',
      {'pol_residence_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'pol_residence_province_str' => 'AQ'} => 'L\' AQUILA',
      {'pol_residence_province_str' => 'AR'} => 'AREZZO',
      {'pol_residence_province_str' => 'AT'} => 'ASTI',
      {'pol_residence_province_str' => 'AV'} => 'AVELLINO',
      {'pol_residence_province_str' => 'BA'} => 'BARI',
      {'pol_residence_province_str' => 'BG'} => 'BERGAMO',
      {'pol_residence_province_str' => 'BI'} => 'BIELLA',
      {'pol_residence_province_str' => 'BL'} => 'BELLUNO',
      {'pol_residence_province_str' => 'BN'} => 'BENEVENTO',
      {'pol_residence_province_str' => 'BO'} => 'BOLOGNA',
      {'pol_residence_province_str' => 'BR'} => 'BRINDISI',
      {'pol_residence_province_str' => 'BS'} => 'BRESCIA',
      {'pol_residence_province_str' => 'BT'} => 'BARLETTA ANDRIA TRANI',
      {'pol_residence_province_str' => 'BZ'} => 'BOLZANO',
      {'pol_residence_province_str' => 'CA'} => 'CAGLIARI',
      {'pol_residence_province_str' => 'CB'} => 'CAMPOBASSO',
      {'pol_residence_province_str' => 'CE'} => 'CASERTA',
      {'pol_residence_province_str' => 'CH'} => 'CHIETI',
      {'pol_residence_province_str' => 'CI'} => 'CARBONIA IGLESIAS',
      {'pol_residence_province_str' => 'CL'} => 'CALTANISSETTA',
      {'pol_residence_province_str' => 'CN'} => 'CUNEO',
      {'pol_residence_province_str' => 'CO'} => 'COMO',
      {'pol_residence_province_str' => 'CR'} => 'CREMONA',
      {'pol_residence_province_str' => 'CS'} => 'COSENZA',
      {'pol_residence_province_str' => 'CT'} => 'CATANIA',
      {'pol_residence_province_str' => 'CZ'} => 'CATANZARO',
      {'pol_residence_province_str' => 'EN'} => 'ENNA',
      {'pol_residence_province_str' => 'FC'} => 'FORLI\' E CESENA',
      {'pol_residence_province_str' => 'FE'} => 'FERRARA',
      {'pol_residence_province_str' => 'FG'} => 'FOGGIA',
      {'pol_residence_province_str' => 'FI'} => 'FIRENZE',
      {'pol_residence_province_str' => 'FM'} => 'FERMO',
      {'pol_residence_province_str' => 'FR'} => 'FROSINONE',
      {'pol_residence_province_str' => 'GE'} => 'GENOVA',
      {'pol_residence_province_str' => 'GO'} => 'GORIZIA',
      {'pol_residence_province_str' => 'GR'} => 'GROSSETO',
      {'pol_residence_province_str' => 'IM'} => 'IMPERIA',
      {'pol_residence_province_str' => 'IS'} => 'ISERNIA',
      {'pol_residence_province_str' => 'KR'} => 'CROTONE',
      {'pol_residence_province_str' => 'LC'} => 'LECCO',
      {'pol_residence_province_str' => 'LE'} => 'LECCE',
      {'pol_residence_province_str' => 'LI'} => 'LIVORNO',
      {'pol_residence_province_str' => 'LO'} => 'LODI',
      {'pol_residence_province_str' => 'LT'} => 'LATINA',
      {'pol_residence_province_str' => 'LU'} => 'LUCCA',
      {'pol_residence_province_str' => 'MB'} => 'MONZA BRIANZA',
      {'pol_residence_province_str' => 'MC'} => 'MACERATA',
      {'pol_residence_province_str' => 'ME'} => 'MESSINA',
      {'pol_residence_province_str' => 'MI'} => 'MILANO',
      {'pol_residence_province_str' => 'MN'} => 'MANTOVA',
      {'pol_residence_province_str' => 'MO'} => 'MODENA',
      {'pol_residence_province_str' => 'MS'} => 'MASSA CARRARA',
      {'pol_residence_province_str' => 'MT'} => 'MATERA',
      {'pol_residence_province_str' => 'NA'} => 'NAPOLI',
      {'pol_residence_province_str' => 'NO'} => 'NOVARA',
      {'pol_residence_province_str' => 'NU'} => 'NUORO',
      {'pol_residence_province_str' => 'OG'} => 'OGLIASTRA',
      {'pol_residence_province_str' => 'OR'} => 'ORISTANO',
      {'pol_residence_province_str' => 'OT'} => 'OLBIA TEMPIO',
      {'pol_residence_province_str' => 'PA'} => 'PALERMO',
      {'pol_residence_province_str' => 'PC'} => 'PIACENZA',
      {'pol_residence_province_str' => 'PD'} => 'PADOVA',
      {'pol_residence_province_str' => 'PE'} => 'PESCARA',
      {'pol_residence_province_str' => 'PG'} => 'PERUGIA',
      {'pol_residence_province_str' => 'PI'} => 'PISA',
      {'pol_residence_province_str' => 'PN'} => 'PORDENONE',
      {'pol_residence_province_str' => 'PO'} => 'PRATO',
      {'pol_residence_province_str' => 'PR'} => 'PARMA',
      {'pol_residence_province_str' => 'PT'} => 'PISTOIA',
      {'pol_residence_province_str' => 'PU'} => 'PESARO E URBINO',
      {'pol_residence_province_str' => 'PV'} => 'PAVIA',
      {'pol_residence_province_str' => 'PZ'} => 'POTENZA',
      {'pol_residence_province_str' => 'RA'} => 'RAVENNA',
      {'pol_residence_province_str' => 'RC'} => 'REGGIO CALABRIA',
      {'pol_residence_province_str' => 'RE'} => 'REGGIO EMILIA',
      {'pol_residence_province_str' => 'RG'} => 'RAGUSA',
      {'pol_residence_province_str' => 'RI'} => 'RIETI',
      {'pol_residence_province_str' => 'RM'} => 'ROMA',
      {'pol_residence_province_str' => 'RN'} => 'RIMINI',
      {'pol_residence_province_str' => 'RO'} => 'ROVIGO',
      {'pol_residence_province_str' => 'SA'} => 'SALERNO',
      {'pol_residence_province_str' => 'SI'} => 'SIENA',
      {'pol_residence_province_str' => 'SO'} => 'SONDRIO',
      {'pol_residence_province_str' => 'SP'} => 'LA SPEZIA',
      {'pol_residence_province_str' => 'SR'} => 'SIRACUSA',
      {'pol_residence_province_str' => 'SS'} => 'SASSARI',
      {'pol_residence_province_str' => 'SV'} => 'SAVONA',
      {'pol_residence_province_str' => 'TA'} => 'TARANTO',
      {'pol_residence_province_str' => 'TE'} => 'TERAMO',
      {'pol_residence_province_str' => 'TN'} => 'TRENTO',
      {'pol_residence_province_str' => 'TO'} => 'TORINO',
      {'pol_residence_province_str' => 'TP'} => 'TRAPANI',
      {'pol_residence_province_str' => 'TR'} => 'TERNI',
      {'pol_residence_province_str' => 'TS'} => 'TRIESTE',
      {'pol_residence_province_str' => 'TV'} => 'TREVISO',
      {'pol_residence_province_str' => 'UD'} => 'UDINE',
      {'pol_residence_province_str' => 'VA'} => 'VARESE',
      {'pol_residence_province_str' => 'VB'} => 'VERBANIA',
      {'pol_residence_province_str' => 'VC'} => 'VERCELLI',
      {'pol_residence_province_str' => 'VE'} => 'VENEZIA',
      {'pol_residence_province_str' => 'VI'} => 'VICENZA',
      {'pol_residence_province_str' => 'VR'} => 'VERONA',
      {'pol_residence_province_str' => 'VS'} => 'MEDIO CAMPIDANO',
      {'pol_residence_province_str' => 'VT'} => 'VITERBO',
      {'pol_residence_province_str' => 'VV'} => 'VIBO VALENTIA',
      {'pol_type_of_contract_str' => 'nuova polizza'} => '[@id="COD_TMOV_N"]',
      {'veh_fuel_str' => 'benzina'} => '//*[@id="COD_TCMB_B"]',
      {'veh_vehicle_type_str' => 'ciclomotore'} => 'CICLOMOTORE USO PRIVATO',

    }

  end

  def build_hash_sect_4()

    @target_values = {}

    @target_values = {

      {'driv_heir_str' => 'no',} => '//*[@id="CLA_ERLE_N"]',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '01',
      {'pol_BM_assigned_str' => '1'} => '01',
      {'pol_BM_assigned_str' => '2'} => '02',
      {'pol_BM_assigned_str' => '3'} => '03',
      {'pol_BM_assigned_str' => '4'} => '04',
      {'pol_BM_assigned_str' => '5'} => '05',
      {'pol_BM_assigned_str' => '6'} => '06',
      {'pol_BM_assigned_str' => '7'} => '07',
      {'pol_BM_assigned_str' => '8'} => '08',
      {'pol_BM_assigned_str' => '9'} => '09',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_quotation_str' => 'fissa'} => 'TARIFFA FISSA',
      {'pol_quotation_str' => 'franchigia'} => 'FRANCHIGIA',
      {'pol_quotation_str' => 'BM'} => 'NO CLAIMS DISCOUNT',
      {'pol_pejus_cu_str' => 'no'} => 'NO PEJUS',
      {'pol_privacy_1_str' => 'si'} => '//*[@id="check1"]',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '26.000.000 EURO',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'pol_residence_str' => 'comune'} => '//*[@id="COD_CAP0_C"]',
      {'pol_residence_str' => 'provincia'} => '//*[@id="COD_CAP0_P"]',
      {'pol_residence_province_str' => 'AG'} => 'AGRIGENTO',
      {'pol_residence_province_str' => 'AL'} => 'ALESSANDRIA',
      {'pol_residence_province_str' => 'AN'} => 'ANCONA',
      {'pol_residence_province_str' => 'AO'} => 'AOSTA',
      {'pol_residence_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'pol_residence_province_str' => 'AQ'} => 'L\' AQUILA',
      {'pol_residence_province_str' => 'AR'} => 'AREZZO',
      {'pol_residence_province_str' => 'AT'} => 'ASTI',
      {'pol_residence_province_str' => 'AV'} => 'AVELLINO',
      {'pol_residence_province_str' => 'BA'} => 'BARI',
      {'pol_residence_province_str' => 'BG'} => 'BERGAMO',
      {'pol_residence_province_str' => 'BI'} => 'BIELLA',
      {'pol_residence_province_str' => 'BL'} => 'BELLUNO',
      {'pol_residence_province_str' => 'BN'} => 'BENEVENTO',
      {'pol_residence_province_str' => 'BO'} => 'BOLOGNA',
      {'pol_residence_province_str' => 'BR'} => 'BRINDISI',
      {'pol_residence_province_str' => 'BS'} => 'BRESCIA',
      {'pol_residence_province_str' => 'BT'} => 'BARLETTA ANDRIA TRANI',
      {'pol_residence_province_str' => 'BZ'} => 'BOLZANO',
      {'pol_residence_province_str' => 'CA'} => 'CAGLIARI',
      {'pol_residence_province_str' => 'CB'} => 'CAMPOBASSO',
      {'pol_residence_province_str' => 'CE'} => 'CASERTA',
      {'pol_residence_province_str' => 'CH'} => 'CHIETI',
      {'pol_residence_province_str' => 'CI'} => 'CARBONIA IGLESIAS',
      {'pol_residence_province_str' => 'CL'} => 'CALTANISSETTA',
      {'pol_residence_province_str' => 'CN'} => 'CUNEO',
      {'pol_residence_province_str' => 'CO'} => 'COMO',
      {'pol_residence_province_str' => 'CR'} => 'CREMONA',
      {'pol_residence_province_str' => 'CS'} => 'COSENZA',
      {'pol_residence_province_str' => 'CT'} => 'CATANIA',
      {'pol_residence_province_str' => 'CZ'} => 'CATANZARO',
      {'pol_residence_province_str' => 'EN'} => 'ENNA',
      {'pol_residence_province_str' => 'FC'} => 'FORLI\' E CESENA',
      {'pol_residence_province_str' => 'FE'} => 'FERRARA',
      {'pol_residence_province_str' => 'FG'} => 'FOGGIA',
      {'pol_residence_province_str' => 'FI'} => 'FIRENZE',
      {'pol_residence_province_str' => 'FM'} => 'FERMO',
      {'pol_residence_province_str' => 'FR'} => 'FROSINONE',
      {'pol_residence_province_str' => 'GE'} => 'GENOVA',
      {'pol_residence_province_str' => 'GO'} => 'GORIZIA',
      {'pol_residence_province_str' => 'GR'} => 'GROSSETO',
      {'pol_residence_province_str' => 'IM'} => 'IMPERIA',
      {'pol_residence_province_str' => 'IS'} => 'ISERNIA',
      {'pol_residence_province_str' => 'KR'} => 'CROTONE',
      {'pol_residence_province_str' => 'LC'} => 'LECCO',
      {'pol_residence_province_str' => 'LE'} => 'LECCE',
      {'pol_residence_province_str' => 'LI'} => 'LIVORNO',
      {'pol_residence_province_str' => 'LO'} => 'LODI',
      {'pol_residence_province_str' => 'LT'} => 'LATINA',
      {'pol_residence_province_str' => 'LU'} => 'LUCCA',
      {'pol_residence_province_str' => 'MB'} => 'MONZA BRIANZA',
      {'pol_residence_province_str' => 'MC'} => 'MACERATA',
      {'pol_residence_province_str' => 'ME'} => 'MESSINA',
      {'pol_residence_province_str' => 'MI'} => 'MILANO',
      {'pol_residence_province_str' => 'MN'} => 'MANTOVA',
      {'pol_residence_province_str' => 'MO'} => 'MODENA',
      {'pol_residence_province_str' => 'MS'} => 'MASSA CARRARA',
      {'pol_residence_province_str' => 'MT'} => 'MATERA',
      {'pol_residence_province_str' => 'NA'} => 'NAPOLI',
      {'pol_residence_province_str' => 'NO'} => 'NOVARA',
      {'pol_residence_province_str' => 'NU'} => 'NUORO',
      {'pol_residence_province_str' => 'OG'} => 'OGLIASTRA',
      {'pol_residence_province_str' => 'OR'} => 'ORISTANO',
      {'pol_residence_province_str' => 'OT'} => 'OLBIA TEMPIO',
      {'pol_residence_province_str' => 'PA'} => 'PALERMO',
      {'pol_residence_province_str' => 'PC'} => 'PIACENZA',
      {'pol_residence_province_str' => 'PD'} => 'PADOVA',
      {'pol_residence_province_str' => 'PE'} => 'PESCARA',
      {'pol_residence_province_str' => 'PG'} => 'PERUGIA',
      {'pol_residence_province_str' => 'PI'} => 'PISA',
      {'pol_residence_province_str' => 'PN'} => 'PORDENONE',
      {'pol_residence_province_str' => 'PO'} => 'PRATO',
      {'pol_residence_province_str' => 'PR'} => 'PARMA',
      {'pol_residence_province_str' => 'PT'} => 'PISTOIA',
      {'pol_residence_province_str' => 'PU'} => 'PESARO E URBINO',
      {'pol_residence_province_str' => 'PV'} => 'PAVIA',
      {'pol_residence_province_str' => 'PZ'} => 'POTENZA',
      {'pol_residence_province_str' => 'RA'} => 'RAVENNA',
      {'pol_residence_province_str' => 'RC'} => 'REGGIO CALABRIA',
      {'pol_residence_province_str' => 'RE'} => 'REGGIO EMILIA',
      {'pol_residence_province_str' => 'RG'} => 'RAGUSA',
      {'pol_residence_province_str' => 'RI'} => 'RIETI',
      {'pol_residence_province_str' => 'RM'} => 'ROMA',
      {'pol_residence_province_str' => 'RN'} => 'RIMINI',
      {'pol_residence_province_str' => 'RO'} => 'ROVIGO',
      {'pol_residence_province_str' => 'SA'} => 'SALERNO',
      {'pol_residence_province_str' => 'SI'} => 'SIENA',
      {'pol_residence_province_str' => 'SO'} => 'SONDRIO',
      {'pol_residence_province_str' => 'SP'} => 'LA SPEZIA',
      {'pol_residence_province_str' => 'SR'} => 'SIRACUSA',
      {'pol_residence_province_str' => 'SS'} => 'SASSARI',
      {'pol_residence_province_str' => 'SV'} => 'SAVONA',
      {'pol_residence_province_str' => 'TA'} => 'TARANTO',
      {'pol_residence_province_str' => 'TE'} => 'TERAMO',
      {'pol_residence_province_str' => 'TN'} => 'TRENTO',
      {'pol_residence_province_str' => 'TO'} => 'TORINO',
      {'pol_residence_province_str' => 'TP'} => 'TRAPANI',
      {'pol_residence_province_str' => 'TR'} => 'TERNI',
      {'pol_residence_province_str' => 'TS'} => 'TRIESTE',
      {'pol_residence_province_str' => 'TV'} => 'TREVISO',
      {'pol_residence_province_str' => 'UD'} => 'UDINE',
      {'pol_residence_province_str' => 'VA'} => 'VARESE',
      {'pol_residence_province_str' => 'VB'} => 'VERBANIA',
      {'pol_residence_province_str' => 'VC'} => 'VERCELLI',
      {'pol_residence_province_str' => 'VE'} => 'VENEZIA',
      {'pol_residence_province_str' => 'VI'} => 'VICENZA',
      {'pol_residence_province_str' => 'VR'} => 'VERONA',
      {'pol_residence_province_str' => 'VS'} => 'MEDIO CAMPIDANO',
      {'pol_residence_province_str' => 'VT'} => 'VITERBO',
      {'pol_residence_province_str' => 'VV'} => 'VIBO VALENTIA',
      {'pol_type_of_contract_str' => 'nuova polizza'} => '[@id="COD_TMOV_N"]',
      {'veh_fuel_str' => 'diesel'} => 'D - GASOLIO',
      {'veh_loading_unloading_str' => 'no'} => 'NO',
      {'veh_marble_blocks_str' => 'no'} => 'NO',
      {'veh_transportation_of_dangerous_goods_A_str' => 'no'} => 'NO',
      {'veh_transportation_of_dangerous_goods_B_str' => 'no'} => 'NO',

    }

  end

end