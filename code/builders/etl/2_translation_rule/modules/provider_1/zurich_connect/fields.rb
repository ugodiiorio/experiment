#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Provider1ZurichConnect
  def build_hash_sect_1()

    #     target_values["fname_fvalue"]

    @target_values = Hash.new

    @target_values = {
      {'pol_blukasko_web_id_str' => 'id elemento'} => 'chkKaskoParziale',
      {'pol_driver_accident_coverage_web_id_str' => 'id elemento'} => 'chkInfortuniConducente',
      {'pol_driving_licence_withdrawal_guarantee_web_id_str' => 'id elemento'} => 'chkRitiroPatente',
      {'pol_glasses_web_id_str' => 'id elemento'} => 'chkComplementareARD',
      {'pol_kasko_web_id_str' => 'id elemento'} => 'chkKaskoCompleta',
      {'pol_legal_assistance_web_id_str' => 'id elemento'} => 'chkTutelaGiud',
      {'pol_natural_events_web_id_str' => 'id elemento'} => 'chkEventiNaturali',
      {'pol_road_assistance_web_id_str' => 'id elemento'} => 'chkAssistenza',
      {'pol_social_political_events_web_id_str' => 'id elemento'} => 'chkEventiSociopolitici',

      {'pol_driving_type_str' => 'esperta'} => 'Guida Esperta',
      {'pol_driving_type_str' => 'libera'} => 'Guida Libera',
      {'own_owner_residence_province_str' => 'AG'} => 'AGRIGENTO',
      {'own_owner_residence_province_str' => 'AL'} => 'ALESSANDRIA',
      {'own_owner_residence_province_str' => 'AN'} => 'ANCONA',
      {'own_owner_residence_province_str' => 'AO'} => 'AOSTA',
      {'own_owner_residence_province_str' => 'AR'} => 'AREZZO',
      {'own_owner_residence_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'own_owner_residence_province_str' => 'AT'} => 'ASTI',
      {'own_owner_residence_province_str' => 'AV'} => 'AVELLINO',
      {'own_owner_residence_province_str' => 'BA'} => 'BARI',
      {'own_owner_residence_province_str' => 'BT'} => 'BARLETTA-ANDRIA-TRANI',
      {'own_owner_residence_province_str' => 'BL'} => 'BELLUNO',
      {'own_owner_residence_province_str' => 'BN'} => 'BENEVENTO',
      {'own_owner_residence_province_str' => 'BG'} => 'BERGAMO',
      {'own_owner_residence_province_str' => 'BI'} => 'label=BIELLA',
      {'own_owner_residence_province_str' => 'BO'} => 'BOLOGNA',
      {'own_owner_residence_province_str' => 'BZ'} => 'BOLZANO',
      {'own_owner_residence_province_str' => 'BS'} => 'BRESCIA',
      {'own_owner_residence_province_str' => 'BR'} => 'BRINDISI',
      {'own_owner_residence_province_str' => 'CA'} => 'CAGLIARI',
      {'own_owner_residence_province_str' => 'CL'} => 'CALTANISSETTA',
      {'own_owner_residence_province_str' => 'CB'} => 'CAMPOBASSO',
      {'own_owner_residence_province_str' => 'CI'} => 'CARBONIA IGLESIAS',
      {'own_owner_residence_province_str' => 'CE'} => 'CASERTA',
      {'own_owner_residence_province_str' => 'CT'} => 'CATANIA',
      {'own_owner_residence_province_str' => 'CZ'} => 'CATANZARO',
      {'own_owner_residence_province_str' => 'CH'} => 'CHIETI',
      {'own_owner_residence_province_str' => 'CO'} => 'COMO',
      {'own_owner_residence_province_str' => 'CS'} => 'COSENZA',
      {'own_owner_residence_province_str' => 'CR'} => 'CREMONA',
      {'own_owner_residence_province_str' => 'KR'} => 'CROTONE',
      {'own_owner_residence_province_str' => 'CN'} => 'CUNEO',
      {'own_owner_residence_province_str' => 'EN'} => 'ENNA',
      {'own_owner_residence_province_str' => 'FM'} => 'FERMO',
      {'own_owner_residence_province_str' => 'FE'} => 'FERRARA',
      {'own_owner_residence_province_str' => 'FI'} => 'FIRENZE',
      {'own_owner_residence_province_str' => 'FG'} => 'FOGGIA',
      {'own_owner_residence_province_str' => 'FC'} => 'FORLI\' CESENA',
      {'own_owner_residence_province_str' => 'FR'} => 'FROSINONE',
      {'own_owner_residence_province_str' => 'GE'} => 'GENOVA',
      {'own_owner_residence_province_str' => 'GO'} => 'GORIZIA',
      {'own_owner_residence_province_str' => 'GR'} => 'GROSSETO',
      {'own_owner_residence_province_str' => 'IM'} => 'IMPERIA',
      {'own_owner_residence_province_str' => 'IS'} => 'ISERNIA',
      {'own_owner_residence_province_str' => 'SP'} => 'LA SPEZIA',
      {'own_owner_residence_province_str' => 'AQ'} => 'L\'AQUILA',
      {'own_owner_residence_province_str' => 'LT'} => 'LATINA',
      {'own_owner_residence_province_str' => 'LE'} => 'LECCE',
      {'own_owner_residence_province_str' => 'LC'} => 'LECCO',
      {'own_owner_residence_province_str' => 'LI'} => 'LIVORNO',
      {'own_owner_residence_province_str' => 'LO'} => 'LODI',
      {'own_owner_residence_province_str' => 'LU'} => 'LUCCA',
      {'own_owner_residence_province_str' => 'MC'} => 'MACERATA',
      {'own_owner_residence_province_str' => 'MN'} => 'MANTOVA',
      {'own_owner_residence_province_str' => 'MS'} => 'MASSA CARRARA',
      {'own_owner_residence_province_str' => 'MT'} => 'MATERA',
      {'own_owner_residence_province_str' => 'ME'} => 'MESSINA',
      {'own_owner_residence_province_str' => 'MI'} => 'MILANO',
      {'own_owner_residence_province_str' => 'MO'} => 'MODENA',
      {'own_owner_residence_province_str' => 'MB'} => 'MONZA E DELLA BRIANZA',
      {'own_owner_residence_province_str' => 'NA'} => 'NAPOLI',
      {'own_owner_residence_province_str' => 'NO'} => 'NOVARA',
      {'own_owner_residence_province_str' => 'NU'} => 'NUORO',
      {'own_owner_residence_province_str' => 'OT'} => 'OLBIA TEMPIO',
      {'own_owner_residence_province_str' => 'OR'} => 'ORISTANO',
      {'own_owner_residence_province_str' => 'PD'} => 'PADOVA',
      {'own_owner_residence_province_str' => 'PA'} => 'PALERMO',
      {'own_owner_residence_province_str' => 'PR'} => 'PARMA',
      {'own_owner_residence_province_str' => 'PV'} => 'PAVIA',
      {'own_owner_residence_province_str' => 'PG'} => 'PERUGIA',
      {'own_owner_residence_province_str' => 'PU'} => 'PESARO E URBINO',
      {'own_owner_residence_province_str' => 'PE'} => 'PESCARA',
      {'own_owner_residence_province_str' => 'PC'} => 'PIACENZA',
      {'own_owner_residence_province_str' => 'PI'} => 'PISA',
      {'own_owner_residence_province_str' => 'PT'} => 'PISTOIA',
      {'own_owner_residence_province_str' => 'PN'} => 'PORDENONE',
      {'own_owner_residence_province_str' => 'PZ'} => 'POTENZA',
      {'own_owner_residence_province_str' => 'PO'} => 'PRATO',
      {'own_owner_residence_province_str' => 'RG'} => 'RAGUSA',
      {'own_owner_residence_province_str' => 'RA'} => 'RAVENNA',
      {'own_owner_residence_province_str' => 'RC'} => 'REGGIO CALABRIA',
      {'own_owner_residence_province_str' => 'RE'} => 'REGGIO EMILIA',
      {'own_owner_residence_province_str' => 'RI'} => 'RIETI',
      {'own_owner_residence_province_str' => 'RN'} => 'RIMINI',
      {'own_owner_residence_province_str' => 'RM'} => 'ROMA',
      {'own_owner_residence_province_str' => 'RO'} => 'ROVIGO',
      {'own_owner_residence_province_str' => 'SA'} => 'SALERNO',
      {'own_owner_residence_province_str' => 'VS'} => 'MEDIO CAMPIDANO',
      {'own_owner_residence_province_str' => 'SS'} => 'SASSARI',
      {'own_owner_residence_province_str' => 'SV'} => 'SAVONA',
      {'own_owner_residence_province_str' => 'SI'} => 'SIENA',
      {'own_owner_residence_province_str' => 'SR'} => 'SIRACUSA',
      {'own_owner_residence_province_str' => 'SO'} => 'SONDRIO',
      {'own_owner_residence_province_str' => 'TA'} => 'TARANTO',
      {'own_owner_residence_province_str' => 'TE'} => 'TERAMO',
      {'own_owner_residence_province_str' => 'TR'} => 'TERNI',
      {'own_owner_residence_province_str' => 'TO'} => 'TORINO',
      {'own_owner_residence_province_str' => 'OG'} => 'OGLIASTRA',
      {'own_owner_residence_province_str' => 'TP'} => 'TRAPANI',
      {'own_owner_residence_province_str' => 'TN'} => 'TRENTO',
      {'own_owner_residence_province_str' => 'TV'} => 'TREVISO',
      {'own_owner_residence_province_str' => 'TS'} => 'TRIESTE',
      {'own_owner_residence_province_str' => 'UD'} => 'UDINE',
      {'own_owner_residence_province_str' => 'VA'} => 'VARESE',
      {'own_owner_residence_province_str' => 'VE'} => 'VENEZIA',
      {'own_owner_residence_province_str' => 'VB'} => 'VERBANO CUSIO OSSOLA',
      {'own_owner_residence_province_str' => 'VC'} => 'VERCELLI',
      {'own_owner_residence_province_str' => 'VR'} => 'VERONA',
      {'own_owner_residence_province_str' => 'VV'} => 'VIBO VALENTIA',
      {'own_owner_residence_province_str' => 'VI'} => 'VICENZA',
      {'own_owner_residence_province_str' => 'VT'} => 'VITERBO',
      {'pol_residence_province_str' => 'AG'} => 'AGRIGENTO',
      {'pol_residence_province_str' => 'AL'} => 'ALESSANDRIA',
      {'pol_residence_province_str' => 'AN'} => 'ANCONA',
      {'pol_residence_province_str' => 'AO'} => 'AOSTA',
      {'pol_residence_province_str' => 'AR'} => 'AREZZO',
      {'pol_residence_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'pol_residence_province_str' => 'AT'} => 'ASTI',
      {'pol_residence_province_str' => 'AV'} => 'AVELLINO',
      {'pol_residence_province_str' => 'BA'} => 'BARI',
      {'pol_residence_province_str' => 'BT'} => 'BARLETTA ANDRIA TRANI',
      {'pol_residence_province_str' => 'BL'} => 'BELLUNO',
      {'pol_residence_province_str' => 'BN'} => 'BENEVENTO',
      {'pol_residence_province_str' => 'BG'} => 'BERGAMO',
      {'pol_residence_province_str' => 'BI'} => 'BIELLA',
      {'pol_residence_province_str' => 'BO'} => 'BOLOGNA',
      {'pol_residence_province_str' => 'BZ'} => 'BOLZANO',
      {'pol_residence_province_str' => 'BS'} => 'BRESCIA',
      {'pol_residence_province_str' => 'BR'} => 'BRINDISI',
      {'pol_residence_province_str' => 'CA'} => 'CAGLIARI',
      {'pol_residence_province_str' => 'CL'} => 'CALTANISSETTA',
      {'pol_residence_province_str' => 'CB'} => 'CAMPOBASSO',
      {'pol_residence_province_str' => 'CI'} => 'CARBONIA IGLESIAS',
      {'pol_residence_province_str' => 'CE'} => 'CASERTA',
      {'pol_residence_province_str' => 'CT'} => 'CATANIA',
      {'pol_residence_province_str' => 'CZ'} => 'CATANZARO',
      {'pol_residence_province_str' => 'CH'} => 'CHIETI',
      {'pol_residence_province_str' => 'CO'} => 'COMO',
      {'pol_residence_province_str' => 'CS'} => 'COSENZA',
      {'pol_residence_province_str' => 'CR'} => 'CREMONA',
      {'pol_residence_province_str' => 'KR'} => 'CROTONE',
      {'pol_residence_province_str' => 'CN'} => 'CUNEO',
      {'pol_residence_province_str' => 'EN'} => 'ENNA',
      {'pol_residence_province_str' => 'FM'} => 'FERMO',
      {'pol_residence_province_str' => 'FE'} => 'FERRARA',
      {'pol_residence_province_str' => 'FI'} => 'FIRENZE',
      {'pol_residence_province_str' => 'FG'} => 'FOGGIA',
      {'pol_residence_province_str' => 'FC'} => 'FORLI\' CESENA',
      {'pol_residence_province_str' => 'FR'} => 'FROSINONE',
      {'pol_residence_province_str' => 'GE'} => 'GENOVA',
      {'pol_residence_province_str' => 'GO'} => 'GORIZIA',
      {'pol_residence_province_str' => 'GR'} => 'GROSSETO',
      {'pol_residence_province_str' => 'IM'} => 'IMPERIA',
      {'pol_residence_province_str' => 'IS'} => 'ISERNIA',
      {'pol_residence_province_str' => 'SP'} => 'LA SPEZIA',
      {'pol_residence_province_str' => 'AQ'} => 'L\'AQUILA',
      {'pol_residence_province_str' => 'LT'} => 'LATINA',
      {'pol_residence_province_str' => 'LE'} => 'LECCE',
      {'pol_residence_province_str' => 'LC'} => 'LECCO',
      {'pol_residence_province_str' => 'LI'} => 'LIVORNO',
      {'pol_residence_province_str' => 'LO'} => 'LODI',
      {'pol_residence_province_str' => 'LU'} => 'LUCCA',
      {'pol_residence_province_str' => 'MC'} => 'MACERATA',
      {'pol_residence_province_str' => 'MN'} => 'MANTOVA',
      {'pol_residence_province_str' => 'MS'} => 'MASSA CARRARA',
      {'pol_residence_province_str' => 'MT'} => 'MATERA',
      {'pol_residence_province_str' => 'ME'} => 'MESSINA',
      {'pol_residence_province_str' => 'MI'} => 'MILANO',
      {'pol_residence_province_str' => 'MO'} => 'MODENA',
      {'pol_residence_province_str' => 'MB'} => 'MONZA E DELLA BRIANZA',
      {'pol_residence_province_str' => 'NA'} => 'NAPOLI',
      {'pol_residence_province_str' => 'NO'} => 'NOVARA',
      {'pol_residence_province_str' => 'NU'} => 'NUORO',
      {'pol_residence_province_str' => 'OT'} => 'OLBIA TEMPIO',
      {'pol_residence_province_str' => 'OR'} => 'ORISTANO',
      {'pol_residence_province_str' => 'PD'} => 'PADOVA',
      {'pol_residence_province_str' => 'PA'} => 'PALERMO',
      {'pol_residence_province_str' => 'PR'} => 'PARMA',
      {'pol_residence_province_str' => 'PV'} => 'PAVIA',
      {'pol_residence_province_str' => 'PG'} => 'PERUGIA',
      {'pol_residence_province_str' => 'PU'} => 'PESARO E URBINO',
      {'pol_residence_province_str' => 'PE'} => 'PESCARA',
      {'pol_residence_province_str' => 'PC'} => 'PIACENZA',
      {'pol_residence_province_str' => 'PI'} => 'PISA',
      {'pol_residence_province_str' => 'PT'} => 'PISTOIA',
      {'pol_residence_province_str' => 'PN'} => 'PORDENONE',
      {'pol_residence_province_str' => 'PZ'} => 'POTENZA',
      {'pol_residence_province_str' => 'PO'} => 'PRATO',
      {'pol_residence_province_str' => 'RG'} => 'RAGUSA',
      {'pol_residence_province_str' => 'RA'} => 'RAVENNA',
      {'pol_residence_province_str' => 'RC'} => 'REGGIO CALABRIA',
      {'pol_residence_province_str' => 'RE'} => 'REGGIO EMILIA',
      {'pol_residence_province_str' => 'RI'} => 'RIETI',
      {'pol_residence_province_str' => 'RN'} => 'RIMINI',
      {'pol_residence_province_str' => 'RM'} => 'ROMA',
      {'pol_residence_province_str' => 'RO'} => 'ROVIGO',
      {'pol_residence_province_str' => 'SA'} => 'SALERNO',
      {'pol_residence_province_str' => 'VS'} => 'MEDIO CAMPIDANO',
      {'pol_residence_province_str' => 'SS'} => 'SASSARI',
      {'pol_residence_province_str' => 'SV'} => 'SAVONA',
      {'pol_residence_province_str' => 'SI'} => 'SIENA',
      {'pol_residence_province_str' => 'SR'} => 'SIRACUSA',
      {'pol_residence_province_str' => 'SO'} => 'SONDRIO',
      {'pol_residence_province_str' => 'TA'} => 'TARANTO',
      {'pol_residence_province_str' => 'TE'} => 'TERAMO',
      {'pol_residence_province_str' => 'TR'} => 'TERNI',
      {'pol_residence_province_str' => 'TO'} => 'TORINO',
      {'pol_residence_province_str' => 'OG'} => 'OGLIASTRA',
      {'pol_residence_province_str' => 'TP'} => 'TRAPANI',
      {'pol_residence_province_str' => 'TN'} => 'TRENTO',
      {'pol_residence_province_str' => 'TV'} => 'TREVISO',
      {'pol_residence_province_str' => 'TS'} => 'TRIESTE',
      {'pol_residence_province_str' => 'UD'} => 'UDINE',
      {'pol_residence_province_str' => 'VA'} => 'VARESE',
      {'pol_residence_province_str' => 'VE'} => 'VENEZIA',
      {'pol_residence_province_str' => 'VB'} => 'VERBANO CUSIO OSSOLA',
      {'pol_residence_province_str' => 'VC'} => 'VERCELLI',
      {'pol_residence_province_str' => 'VR'} => 'VERONA',
      {'pol_residence_province_str' => 'VV'} => 'VIBO VALENTIA',
      {'pol_residence_province_str' => 'VI'} => 'VICENZA',
      {'pol_residence_province_str' => 'VT'} => 'VITERBO',
      {'veh_abs_str' => 'si'} => 'ABS presente',
      {'veh_airbag_str' => 'si'} => 'Airbag lato guida + passeggero',
      {'veh_fuel_str' => 'B'} => 'BENZINA',
      {'veh_fuel_str' => 'D'} => 'DIESEL',
      {'veh_fuel_str' => 'G'} => 'GPL',
      {'veh_fuel_str' => 'M'} => 'METANO',
      {'veh_alarm_str' => 'immobilizer'} => 'IMMOBILIZER',
      {'veh_antiskid_str' => 'no'} => 'Assente',
      {'pol_bersani_str' => 'convivente'} => 'SI',
      {'pol_bersani_str' => 'veicolo'} => 'SI',
      {'pol_bersani_str' => 'no'} => 'NO',
      {'pol_BM_assigned_str' => '-1'} => '1',
      {'pol_BM_assigned_str' => '1'} => '1',
      {'pol_BM_assigned_str' => '2'} => '2',
      {'pol_BM_assigned_str' => '3'} => '3',
      {'pol_BM_assigned_str' => '4'} => '4',
      {'pol_BM_assigned_str' => '5'} => '5',
      {'pol_BM_assigned_str' => '6'} => '6',
      {'pol_BM_assigned_str' => '7'} => '7',
      {'pol_BM_assigned_str' => '8'} => '8',
      {'pol_BM_assigned_str' => '9'} => '9',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'Passaparola',
      {'pol_subscriber_is_owner_str' => 'si'} => 'SI',
      {'pol_subscriber_is_owner_str' => 'no'} => 'NO',
      {'pol_family_members_insured_with_company_str' => '0'} => 'NO',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_instalment_str' => 'semestrale'} => 'Semestrale',
      {'veh_tow_hook_str' => 'no'} => 'Senza gancio traino',
      {'veh_tow_hook_str' => 'no'} => 'Senza gancio traino',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '4.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '20.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '20.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '6.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '6.000.000 UNICO',

      {'pol_public_liability_indemnity_limit_str' => '1600000'} => '20.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '2500000'} => '50.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '5000000'} => '50.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '800000'} => '2.500.000 - 500.000',

      {'pol_defined_drive_str' => 'si'} => 'Guida Esperta',
      {'pol_free_drive_str' => 'si'} => 'Guida Libera',
      {'own_owner_sex_str' => 'M'} => 'Maschio',
      {'own_owner_sex_str' => 'F'} => 'Femmina',
      {'own_owner_sex_str' => 'C'} => 'PersonaGiuridica',
      {'pol_claims_total_number_str'  => '0'} => 'Nessun sinistro',
      {'pol_claims_total_number_str'  => '1'} => '1 sinistro',
      {'pol_claims_total_number_str'  => '2'} => '2 sinistri',
      {'pol_claims_total_number_str'  => '3'} => '4 sinistri e oltre',

      {'pol_insurance_situation_str' => 'veicolo gia\' assicurato con atr'} => 'L\'automobile e\' gia\' assicurata con un contratto in Bonus/Malus',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo nuovo'} => 'Sto acquistando un\'auto usata e mi assicuro per la prima volta',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo usato'} => 'Sto acquistando un\'auto nuova e mi assicuro per la prima volta',
      {'veh_stabilizer_str' => 'no'} => 'NO',
      {'driv_civil_status_str' => 'Coniugato senza figli'} => 'Coniugato senza figli',
      {'driv_studies_str' => 'Diploma'} => 'Diploma',
      {'veh_num_of_owners_str' => '1'} => '1',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '1'} => '1 anno',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '0'} => '0 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '2'} => '2 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '3'} => '3 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '4'} => '4 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '5'} => '5 anni',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'lblvPremioAnnualeLordo lblvPremioAnnualeLordoSconto',
      {'pol_driver_accident_coverage_web_id_str' => 'id elemento'} => 'chkInfortuniConducente',
      {'pol_theft_fire_coverage_web_id_str' => 'id elemento'} => 'chkIncendioFurto',

    }











































    #  costruisci hash ["field_name + field_value","target"]
  end


end