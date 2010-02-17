#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Fields_Directline

  def build_hash_sect_1()

#     target_values["fname_fvalue"]

    @target_values = Hash.new

    @target_values = {
      {'pol_driver_less_than_26_yrs_str' => 'N'} => 'Nessuno',
      # {'pol_driver_less_than_26_yrs_str' => 'S'} => 'ÒUn conducenteÓ, ÒDue conducentiÓ, ÒPi di due conducentiÓ',
      {'veh_alarm_str' => 'immobilizer'} => 'Immobilizzatore o Satellitare',
      {'pol_bersani_str' => 'Convivente'} => 'id_radio_tipo_bm_1',
      {'pol_bersani_str' => 'Veicolo'} => 'id_radio_tipo_bm_1',
      {'pol_bersani_str' => 'Veicolo'} => 'id_radio_tipo_bm_2',
      {'pol_coming_from_BM_num' => '-1'} => '01',
      {'pol_coming_from_BM_num' => '1'} => '01',
      {'pol_coming_from_BM_num' => '2'} => '02',
      {'pol_coming_from_BM_num' => '3'} => '03',
      {'pol_coming_from_BM_num' => '4'} => '04',
      {'pol_coming_from_BM_num' => '5'} => '05',
      {'pol_coming_from_BM_num' => '6'} => '06',
      {'pol_coming_from_BM_num' => '7'} => '07',
      {'pol_coming_from_BM_num' => '8'} => '08',
      {'pol_coming_from_BM_num' => '9'} => '09',
      {'pol_coming_from_BM_num' => '10'} => '10',
      {'pol_coming_from_BM_num' => '11'} => '11',
      {'pol_coming_from_BM_num' => '12'} => '12',
      {'pol_coming_from_BM_num' => '13'} => '13',
      {'pol_coming_from_BM_num' => '14'} => '14',
      {'pol_coming_from_BM_num' => '15'} => '15',
      {'pol_coming_from_BM_num' => '16'} => '16',
      {'pol_coming_from_BM_num' => '17'} => '17',
      {'pol_coming_from_BM_num' => '18'} => '18',
      {'pol_BM_assigned_str' => '-1'} => '01',
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
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'INTERNET',
      {'pol_subscriber_is_driver_str' => 'si'} => '//form/table[2]/tbody/tr[17]/td[2]/input',  #/html/body/table[2]/tbody/tr/td[4]  precede sempre form/...
      {'pol_subscriber_is_owner_str' => 'si'} => '//form/table[2]/tbody/tr[21]/td[2]/input',
      {'pol_subscriber_is_owner_str' => 'no'} => '//form/table[2]/tbody/tr[21]/td[2]/input[3]',
      {'pol_family_members_insured_with_company_str' => '0'} => '//form/table[2]/tbody/tr[13]/td[2]/input[3]',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_instalment_str' => 'semestrale'} => 'Semestrale',
      {'pol_bersani_ref_car_already_insured_with_company_str' => 'no'} => '//form/table[2]/tbody/tr[13]/td[2]/input[3]',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '3.600.000/1.000.000',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '5.000.000/1.000.000',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '5.000.000/1.000.000',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '5.000.000/1.000.000',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '5.000.000/1.000.000',
      {'veh_vehicle_shelter_str' => 'box privato'} => 'Box privato',
      {'pol_owner_sex_str' => 'M'} => '//form/table[2]/tbody/tr[3]/td[5]/input',
      {'pol_owner_sex_str' => 'F'} => '//form/table[2]/tbody/tr[3]/td[5]/input[3]',
      {'pol_driver_sex_str' => 'M'} => '//form/table[2]/tbody/tr[3]/td[5]/input',
      {'pol_driver_sex_str' => 'F'} => '//form/table[2]/tbody/tr[3]/td[5]/input[4]',
      {'pol_insurance_situation_str' => 'veicolo gi\' assicurato con atr'} => '//*[@id="id_radio_bm"]',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo nuovo'} => '//table/tbody/tr[10]/td/table/tbody/tr[3]/td[2]/input',  #/html/body/table[2]/tbody/tr/td[4]  precede sempre table/...
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo usato'} => '//table/tbody/tr[10]/td/table/tbody/tr[4]/td[2]/input',
      {'driv_civil_status_str' => 'Coniugato senza figli'} => 'Sposato/a',
      {'veh_habitual_vehicle_use_str' => 'tempo libero-casa lavoro'} => ' Tragitto Casa-Lavoro/Tempo libero',
      {'veh_vehicle_use_str' => 'privato'} => '//form/table[2]/tbody/tr[15]/td[2]/table/tbody/tr[2]/td/input',
      {'pol_residence_province_str' => 'AG'} => 'AGRIGENTO',
      {'pol_residence_province_str' => 'AL'} => 'ALESSANDRIA',
      {'pol_residence_province_str' => 'AN'} => 'ANCONA',
      {'pol_residence_province_str' => 'AO'} => 'AOSTA',
      {'pol_residence_province_str' => 'AR'} => 'AREZZO',
      {'pol_residence_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'pol_residence_province_str' => 'AT'} => 'ASTI',
      {'pol_residence_province_str' => 'AV'} => 'AVELLINO',
      {'pol_residence_province_str' => 'BA'} => 'BARI',
      {'pol_residence_province_str' => 'BT'} => 'BARLETTA-ANDRIA-TRANI',
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
      {'pol_residence_province_str' => 'CI'} => 'CARBONIA-IGLESIAS',
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
      {'pol_residence_province_str' => 'FC'} => 'FORLI\'-CESENA',
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
      {'pol_residence_province_str' => 'MS'} => 'MASSA-CARRARA',
      {'pol_residence_province_str' => 'MT'} => 'MATERA',
      {'pol_residence_province_str' => 'ME'} => 'MESSINA',
      {'pol_residence_province_str' => 'MI'} => 'MILANO',
      {'pol_residence_province_str' => 'MO'} => 'MODENA',
      {'pol_residence_province_str' => 'MB'} => 'MONZA E DELLA BRIANZA',
      {'pol_residence_province_str' => 'NA'} => 'NAPOLI',
      {'pol_residence_province_str' => 'NO'} => 'NOVARA',
      {'pol_residence_province_str' => 'NU'} => 'NUORO',
      {'pol_residence_province_str' => 'OT'} => 'OLBIA-TEMPIO',
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
      {'pol_residence_province_str' => 'VT'} => 'VITERBO'
         }











































#  costruisci hash ["field_name + field_value","target"]
  end


end