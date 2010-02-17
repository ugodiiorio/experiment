#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Fields_Conte
  def build_hash_sect_1()

    #     target_values["fname_fvalue"]

    @target_values = Hash.new

    @target_values = {
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
      {'pol_residence_province_str' => 'VT'} => 'VITERBO',
      {'driv_birth_province_str' => 'AG'} => 'AGRIGENTO',
      {'driv_birth_province_str' => 'AL'} => 'ALESSANDRIA',
      {'driv_birth_province_str' => 'AN'} => 'ANCONA',
      {'driv_birth_province_str' => 'AO'} => 'AOSTA',
      {'driv_birth_province_str' => 'AR'} => 'AREZZO',
      {'driv_birth_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'driv_birth_province_str' => 'AT'} => 'ASTI',
      {'driv_birth_province_str' => 'AV'} => 'AVELLINO',
      {'driv_birth_province_str' => 'BA'} => 'BARI',
      {'driv_birth_province_str' => 'BT'} => 'BARLETTA-ANDRIA-TRANI',
      {'driv_birth_province_str' => 'BL'} => 'BELLUNO',
      {'driv_birth_province_str' => 'BN'} => 'BENEVENTO',
      {'driv_birth_province_str' => 'BG'} => 'BERGAMO',
      {'driv_birth_province_str' => 'BI'} => 'BIELLA',
      {'driv_birth_province_str' => 'BO'} => 'BOLOGNA',
      {'driv_birth_province_str' => 'BZ'} => 'BOLZANO',
      {'driv_birth_province_str' => 'BS'} => 'BRESCIA',
      {'driv_birth_province_str' => 'BR'} => 'BRINDISI',
      {'driv_birth_province_str' => 'CA'} => 'CAGLIARI',
      {'driv_birth_province_str' => 'CL'} => 'CALTANISSETTA',
      {'driv_birth_province_str' => 'CB'} => 'CAMPOBASSO',
      {'driv_birth_province_str' => 'CI'} => 'CARBONIA-IGLESIAS',
      {'driv_birth_province_str' => 'CE'} => 'CASERTA',
      {'driv_birth_province_str' => 'CT'} => 'CATANIA',
      {'driv_birth_province_str' => 'CZ'} => 'CATANZARO',
      {'driv_birth_province_str' => 'CH'} => 'CHIETI',
      {'driv_birth_province_str' => 'CO'} => 'COMO',
      {'driv_birth_province_str' => 'CS'} => 'COSENZA',
      {'driv_birth_province_str' => 'CR'} => 'CREMONA',
      {'driv_birth_province_str' => 'KR'} => 'CROTONE',
      {'driv_birth_province_str' => 'CN'} => 'CUNEO',
      {'driv_birth_province_str' => 'EN'} => 'ENNA',
      {'driv_birth_province_str' => 'FM'} => 'FERMO',
      {'driv_birth_province_str' => 'FE'} => 'FERRARA',
      {'driv_birth_province_str' => 'FI'} => 'FIRENZE',
      {'driv_birth_province_str' => 'FG'} => 'FOGGIA',
      {'driv_birth_province_str' => 'FC'} => 'FORLI\'-CESENA',
      {'driv_birth_province_str' => 'FR'} => 'FROSINONE',
      {'driv_birth_province_str' => 'GE'} => 'GENOVA',
      {'driv_birth_province_str' => 'GO'} => 'GORIZIA',
      {'driv_birth_province_str' => 'GR'} => 'GROSSETO',
      {'driv_birth_province_str' => 'IM'} => 'IMPERIA',
      {'driv_birth_province_str' => 'IS'} => 'ISERNIA',
      {'driv_birth_province_str' => 'SP'} => 'LA SPEZIA',
      {'driv_birth_province_str' => 'AQ'} => 'L\'AQUILA',
      {'driv_birth_province_str' => 'LT'} => 'LATINA',
      {'driv_birth_province_str' => 'LE'} => 'LECCE',
      {'driv_birth_province_str' => 'LC'} => 'LECCO',
      {'driv_birth_province_str' => 'LI'} => 'LIVORNO',
      {'driv_birth_province_str' => 'LO'} => 'LODI',
      {'driv_birth_province_str' => 'LU'} => 'LUCCA',
      {'driv_birth_province_str' => 'MC'} => 'MACERATA',
      {'driv_birth_province_str' => 'MN'} => 'MANTOVA',
      {'driv_birth_province_str' => 'MS'} => 'MASSA-CARRARA',
      {'driv_birth_province_str' => 'MT'} => 'MATERA',
      {'driv_birth_province_str' => 'ME'} => 'MESSINA',
      {'driv_birth_province_str' => 'MI'} => 'MILANO',
      {'driv_birth_province_str' => 'MO'} => 'MODENA',
      {'driv_birth_province_str' => 'MB'} => 'MONZA E DELLA BRIANZA',
      {'driv_birth_province_str' => 'NA'} => 'NAPOLI',
      {'driv_birth_province_str' => 'NO'} => 'NOVARA',
      {'driv_birth_province_str' => 'NU'} => 'NUORO',
      {'driv_birth_province_str' => 'OT'} => 'OLBIA-TEMPIO',
      {'driv_birth_province_str' => 'OR'} => 'ORISTANO',
      {'driv_birth_province_str' => 'PD'} => 'PADOVA',
      {'driv_birth_province_str' => 'PA'} => 'PALERMO',
      {'driv_birth_province_str' => 'PR'} => 'PARMA',
      {'driv_birth_province_str' => 'PV'} => 'PAVIA',
      {'driv_birth_province_str' => 'PG'} => 'PERUGIA',
      {'driv_birth_province_str' => 'PU'} => 'PESARO E URBINO',
      {'driv_birth_province_str' => 'PE'} => 'PESCARA',
      {'driv_birth_province_str' => 'PC'} => 'PIACENZA',
      {'driv_birth_province_str' => 'PI'} => 'PISA',
      {'driv_birth_province_str' => 'PT'} => 'PISTOIA',
      {'driv_birth_province_str' => 'PN'} => 'PORDENONE',
      {'driv_birth_province_str' => 'PZ'} => 'POTENZA',
      {'driv_birth_province_str' => 'PO'} => 'PRATO',
      {'driv_birth_province_str' => 'RG'} => 'RAGUSA',
      {'driv_birth_province_str' => 'RA'} => 'RAVENNA',
      {'driv_birth_province_str' => 'RC'} => 'REGGIO CALABRIA',
      {'driv_birth_province_str' => 'RE'} => 'REGGIO EMILIA',
      {'driv_birth_province_str' => 'RI'} => 'RIETI',
      {'driv_birth_province_str' => 'RN'} => 'RIMINI',
      {'driv_birth_province_str' => 'RM'} => 'ROMA',
      {'driv_birth_province_str' => 'RO'} => 'ROVIGO',
      {'driv_birth_province_str' => 'SA'} => 'SALERNO',
      {'driv_birth_province_str' => 'VS'} => 'MEDIO CAMPIDANO',
      {'driv_birth_province_str' => 'SS'} => 'SASSARI',
      {'driv_birth_province_str' => 'SV'} => 'SAVONA',
      {'driv_birth_province_str' => 'SI'} => 'SIENA',
      {'driv_birth_province_str' => 'SR'} => 'SIRACUSA',
      {'driv_birth_province_str' => 'SO'} => 'SONDRIO',
      {'driv_birth_province_str' => 'TA'} => 'TARANTO',
      {'driv_birth_province_str' => 'TE'} => 'TERAMO',
      {'driv_birth_province_str' => 'TR'} => 'TERNI',
      {'driv_birth_province_str' => 'TO'} => 'TORINO',
      {'driv_birth_province_str' => 'OG'} => 'OGLIASTRA',
      {'driv_birth_province_str' => 'TP'} => 'TRAPANI',
      {'driv_birth_province_str' => 'TN'} => 'TRENTO',
      {'driv_birth_province_str' => 'TV'} => 'TREVISO',
      {'driv_birth_province_str' => 'TS'} => 'TRIESTE',
      {'driv_birth_province_str' => 'UD'} => 'UDINE',
      {'driv_birth_province_str' => 'VA'} => 'VARESE',
      {'driv_birth_province_str' => 'VE'} => 'VENEZIA',
      {'driv_birth_province_str' => 'VB'} => "VERBANO CUSIO OSSOLA",
      {'driv_birth_province_str' => 'VC'} => 'VERCELLI',
      {'driv_birth_province_str' => 'VR'} => 'VERONA',
      {'driv_birth_province_str' => 'VV'} => 'VIBO VALENTIA',
      {'driv_birth_province_str' => 'VI'} => 'VICENZA',
      {'driv_birth_province_str' => 'VT'} => 'VITERBO',
      {'veh_fuel_str' => 'B'} => 'Benzina',
{'veh_fuel_str' => 'D'} => 'Diesel',
{'veh_fuel_str' => 'G'} => 'GPL',
{'veh_fuel_str' => 'M'} => 'Metano',
{'veh_alarm_str' => 'immobilizer'} => 'Immobilizer',
{'pol_bersani_str' => 'Convivente'} => 'page:decreto_bersani:0',
{'pol_bersani_str' => 'Veicolo'} => 'page:decreto_bersani:0',
{'pol_bersani_str' => 'No'} => 'page:decreto_bersani:1',
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
{'pol_subscriber_is_driver_str' => 'si'} => 'page:conducente_principale:0',
{'pol_subscriber_is_owner_str' => 'si'} => 'page:contraente_proprietario:0',
{'pol_subscriber_is_owner_str' => 'no'} => 'page:contraente_proprietario:1',
{'pol_cohabiting_children_str' => 'si'} => 'page:figli_minori:0',
{'pol_instalment_str' => 'annuale'} => 'Annuale',
{'pol_instalment_str' => 'semestrale'} => 'Semestrale',
{'veh_km_per_yr_num' => '15000'} => '15',
{'pol_public_liability_indemnity_limit_str' => '3000000'} => '2,500,000',
{'pol_public_liability_indemnity_limit_str' => '25000000'} => '25,000,000',
{'pol_public_liability_indemnity_limit_str' => '18000000'} => '15,000,000',
{'pol_public_liability_indemnity_limit_str' => '12000000'} => '10,000,000',
{'pol_public_liability_indemnity_limit_str' => '6000000'} => '5,000,000',
{'pol_payment_str' => 'carta di credito'} => 'page:metodoDiPagamento:0',
{'veh_modification_made_str' => 'no'} => 'page:modifiche_scelta:1',
{'pol_drunkenness_fine_str' => 'no'} => 'page:multe_ebrezza_contraente:1',
{'pol_privacy_1_str' => 'id elemento web1'} => 'page:privacy_contr',
{'driv_driving_license_points_str' => '20'} => 'Più di 20',
{'driv_residence_same_as_home_address_str' => 'si'} => 'page:conducente_principale_recapito:0',
{'veh_vehicle_shelter_str' => 'box privato'} => 'Box',
{'pol_driver_sex_str' => 'M'} => 'page:conducente_principale_sesso:0',
{'pol_driver_sex_str' => 'F'} => 'page:conducente_principale_sesso:1',
{'pol_insurance_situation_str' => 'veicolo gi\' assicurato con atr'} => 'page:situazione_1:1',
{'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo nuovo'} => 'page:situazione_1:0',
{'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo usato'} => 'page:situazione_1:0',
{'pol_driving_license_suspension_str' => 'no'} => 'page:sospensione_patente_contraente:1',
{'driv_civil_status_str' => 'Coniugato senza figli'} => 'coniugato/a o convivente',
{'driv_birth_state_str' => 'ITALIA'} => 'page:conducente_nazione:0',
{'driv_birth_state_str' => 'Tutto il resto'} => 'page:conducente_nazione:1',
{'driv_driving_license_type_str' => 'B'} => 'B (auto)',
{'own_owner_specification_str' => 'M'} => 'page:relazione_contraente_proprietario_passo1:0',
{'own_owner_specification_str' => 'F'} => 'page:relazione_contraente_proprietario_passo1:0',
{'own_owner_specification_str' => 'C'} => 'page:relazione_contraente_proprietario_passo1:1',
{'veh_habitual_vehicle_use_str' => 'tempo libero-casa lavoro'} => 'Tragitto Casa-Lavoro',
{'pol_other_vehicle_use_str' => 'no'} => 'page:altro_veicolo:1',
{'veh_new_used_vehicle_str' => 'N'} => 'page:situazione_2:0',
{'veh_new_used_vehicle_str' => 'U'} => 'page:situazione_2:1'

    }











































    #  costruisci hash ["field_name + field_value","target"]
  end


end