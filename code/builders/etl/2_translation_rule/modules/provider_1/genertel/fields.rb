#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Provider1Genertel

  def build_hash_sect_1()

    #     target_values["fname_fvalue"]

    @target_values = Hash.new

    @target_values = {
      {'driv_job_2_str' => 'campo tecnico per genertel'} => 'index 1',
#      {'pol_nr_of_paid_claims_3_yr_str' => '0'} => '0',
      {'pol_BM_assigned_str' => '-1'} => '1',
      {'pol_BM_assigned_str' => '1'} => '1',
      {'pol_coming_from_BM_num' => '-1'} => '1',
      {'pol_coming_from_BM_num' => '1'} => '1',
      {'pol_nr_of_paid_claims_3_yr_str' => '1'} => '1',
      {'pol_BM_assigned_str' => '2'} => '2',
      {'pol_coming_from_BM_num' => '2'} => '2',
      {'pol_nr_of_paid_claims_3_yr_str' => '2'} => '2',
      {'pol_BM_assigned_str' => '3'} => '3',
      {'pol_coming_from_BM_num' => '3'} => '3',
      {'pol_BM_assigned_str' => '4'} => '4',
      {'pol_coming_from_BM_num' => '4'} => '4',
      {'pol_BM_assigned_str' => '5'} => '5',
      {'pol_coming_from_BM_num' => '5'} => '5',
      {'pol_BM_assigned_str' => '6'} => '6',
      {'pol_coming_from_BM_num' => '6'} => '6',
      {'pol_BM_assigned_str' => '7'} => '7',
      {'pol_coming_from_BM_num' => '7'} => '7',
      {'pol_BM_assigned_str' => '8'} => '8',
      {'pol_coming_from_BM_num' => '8'} => '8',
      {'pol_BM_assigned_str' => '9'} => '9',
      {'pol_coming_from_BM_num' => '9'} => '9',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_coming_from_BM_num' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_coming_from_BM_num' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_coming_from_BM_num' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_coming_from_BM_num' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_coming_from_BM_num' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_coming_from_BM_num' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_coming_from_BM_num' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_coming_from_BM_num' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_coming_from_BM_num' => '18'} => '18',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '€ 3,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '€ 6,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '€ 10,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '€ 10,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '€ 10,000,000.00',
      {'veh_airbag_str' => 'si'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[11]/div[2]/div/div/div/div/img',
      {'veh_abs_str' => 'si'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[12]/div[2]/div/div/div/div/img',
      {'veh_vehicle_shelter_str' => 'box privato'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[13]/div[2]/div/div/div/div/img',
      {'pol_privacy_1_str' => 'id elemento web1'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[2]/div[2]/div/div/div/div/img',
      {'pol_privacy_2_str' => 'id elemento web2'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[3]/div[2]/div/div/div/div/img',
      {'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'N'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[3]/div[3]/div[2]/div/div[2]/div/div/img',
      {'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'S'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[3]/div[3]/div[2]/div/div/div/div/img',
      {'pol_subscriber_is_driver_str' => 'si'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[3]/div/div[2]/div[2]/div/div/div/div/img',
      {'pol_cohabiting_children_str' => 'si'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[3]/div/div[4]/div[2]/div/div/div/div/img',
      {'pol_privacy_3_str' => 'id elemento web3'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[4]/div[2]/div/div/div/div/img',
      {'pol_road_assistance_code_str' => 'id elemento'} => '/html/body/form[2]/div/div/div[2]/div[5]/div/div[3]/div/table/tbody/tr[6]/td[4]/div/div/div/img',
      {'pol_legal_assistance_code_str' => 'id elemento'} => '/html/body/form[2]/div/div/div[2]/div[5]/div/div[3]/div/table/tbody/tr[7]/td[4]/div/div/div/img',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/form[2]/div/div/p/label[2]/span',
      {'pol_bersani_ref_vehicle_insured_with_company_str' => 'no'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div[2]/div[2]/div[4]/div[2]/div/div[2]/div/div/img',
      {'pol_bersani_str' => 'no'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div[2]/div[2]/div/div[2]/div/div[2]/div/div/img',
      {'pol_bersani_str' => 'convivente'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div[2]/div[2]/div/div[2]/div/div/div/div/img',
      {'pol_bersani_str' => 'veicolo'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div[2]/div[2]/div/div[2]/div/div/div/div/img',
      {'pol_current_policy_guarantee_str' => 'nessuna'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div[2]/div/div[6]/div[5]/div/div/div/img',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo nuovo'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div/div/div/div[2]/div/div/img',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo usato'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div/div/div/div[3]/div/div/img',
      {'pol_insurance_situation_str' => 'veicolo gia\' assicurato con atr'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div/div/div/div/div/div/img',
      {'pol_leasing_str' => 'no'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[5]/div[2]/div[2]/div/div[2]/div/div/img',
      {'pol_subscriber_is_owner_str' => 'no'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div[11]/div[2]/div/div[2]/div/div/img',
      {'pol_subscriber_is_owner_str' => 'si'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div[11]/div[2]/div/div/div/div/img',
      {'pol_client_type_str' => 'persona giuridica'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div/div[2]/div/div[2]/div/div/img',
      {'driv_driver_sex_str' => 'F'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div[4]/div[2]/div/div[2]/div/div/img',
      {'pol_client_type_str' => 'persona fisica'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div[4]/div[2]/div/div/div/div/img',
      {'driv_driver_sex_str' => 'M'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div[4]/div[2]/div/div/div/div/img',
      {'own_owner_specification_str' => 'C'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div/div[2]/div/div[2]/div/div/img',
      {'own_owner_specification_str' => 'M'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div/div[2]/div/div/div/div/img',
      {'own_owner_specification_str' => 'F'} => '/html/body/form[3]/div/div/div[2]/div[4]/div/div/div[2]/div/div/div/div/img',
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'Amici/parenti',
      {'pol_instalment_str' => 'annuale'} => 'annuale',
      {'pol_instalment_str' => 'semestrale'} => 'annuale',
      {'veh_fuel_str' => 'B'} => 'Benzina',
      {'veh_fuel_str' => 'D'} => 'Diesel',
      {'veh_fuel_str' => 'G'} => 'GPL/Metano',
      {'veh_fuel_str' => 'M'} => 'GPL/Metano',
      #      {'veh_alarm_str' => 'immobilizer'} => 'Immobilizzatore con allarme',
      {'veh_alarm_str' => 'immobilizer'} => 'Immobilizzatore senza allarme',
#      {'pol_nr_of_paid_claims_3_yr_str' => 'N/A'} => 'N.A.',
#      {'pol_nr_of_paid_claims_3_yr_str' => 'N/D'} => 'N.A.',
      {'pol_bersani_ref_vehicle_number_plate_str' => 'ab123dc'} => 'ab123dc',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato',
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