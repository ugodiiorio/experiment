module Provider2Genertel

  def build_hash_sect_1()

    @target_values = Hash.new

    @target_values = {

      {'pol_contingency_protection_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX10X5',
      {'pol_driver_accident_coverage_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX7X5',
      {'pol_legal_assistance_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX6X5',
      {'pol_minikasko_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX11X5',
      {'pol_road_assistance_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX5X5',
      {'pol_protected_bonus_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX3X5',

      {'driv_job_str' => 'dipendente/impiegato/funzionario/dirigente'} => 'Impiegato/a',
      {'driv_job_str' => 'insegnante'} => 'Insegnante',
      {'driv_job_str' => 'libero professionista'} => 'Libero professionista',
      {'driv_job_str' => 'casalinga'} => 'Casalinga/o',
      {'driv_job_str' => 'militare'} => 'Forze armate',
      {'driv_job_str' => 'operaio'} => 'Operaio/a',
      {'driv_job_str' => 'ecclesiastico'} => 'Religioso/a',
      {'driv_job_str' => 'pensionato da lavoro'} => 'Pensionato/a',
      {'driv_job_str' => 'medico'} => 'Altro',
      {'driv_job_str' => 'studente'} => 'Studente',
      {'driv_job_str' => 'artigiano'} => 'Artigiano/a',
      {'driv_job_str' => 'autista professionista'} => 'Altro',
      {'driv_job_str' => 'avvocato'} => 'Libero professionista',
      {'driv_job_str' => 'commerciante'} => 'Commerciante/esercente',
      {'driv_job_str' => 'disoccupato'} => 'Non occupato/a',
      {'driv_job_str' => 'imprenditore/industriale'} => 'Imprenditore',
      {'driv_job_str' => 'ingegnere'} => 'Altro',

      {'veh_vehicle_value_str' => '5000'} => 'index 1',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'LBLXRIEXValuta',
      {'veh_km_per_yr_str' => 'campo tecnico per genertel'} => 'index 1',
      {'driv_job_2_str' => 'campo tecnico per genertel'} => 'index 1',
      #      {'pol_nr_of_paid_claims_3_yr_str' => '0'} => '0',
      {'pol_BM_assigned_str' => '-1'} => '1',
      {'pol_BM_assigned_str' => '1'} => '1',
      {'pol_coming_from_BM_str' => '-1'} => '1',
      {'pol_coming_from_BM_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_3_yr_str' => '1'} => '1',
      {'pol_BM_assigned_str' => '2'} => '2',
      {'pol_coming_from_BM_str' => '2'} => '2',
      {'pol_nr_of_paid_claims_3_yr_str' => '2'} => '2',
      {'pol_BM_assigned_str' => '3'} => '3',
      {'pol_coming_from_BM_str' => '3'} => '3',
      {'pol_BM_assigned_str' => '4'} => '4',
      {'pol_coming_from_BM_str' => '4'} => '4',
      {'pol_BM_assigned_str' => '5'} => '5',
      {'pol_coming_from_BM_str' => '5'} => '5',
      {'pol_BM_assigned_str' => '6'} => '6',
      {'pol_coming_from_BM_str' => '6'} => '6',
      {'pol_BM_assigned_str' => '7'} => '7',
      {'pol_coming_from_BM_str' => '7'} => '7',
      {'pol_BM_assigned_str' => '8'} => '8',
      {'pol_coming_from_BM_str' => '8'} => '8',
      {'pol_BM_assigned_str' => '9'} => '9',
      {'pol_coming_from_BM_str' => '9'} => '9',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_coming_from_BM_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_coming_from_BM_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_coming_from_BM_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_coming_from_BM_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_coming_from_BM_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_coming_from_BM_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_coming_from_BM_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_coming_from_BM_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_coming_from_BM_str' => '18'} => '18',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '€ 3,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '€ 6,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '€ 10,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '18,000,000'} => '€ 10,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '€ 10,000,000.00',
      {'veh_airbag_str' => 'si'} => 'RBTXDVEXAirbag0',
      {'veh_abs_str' => 'si'} => 'RBTXDVEXAbs0',
      {'veh_vehicle_shelter_str' => 'box privato'} => 'RBTXDVEXCustodia0',
      {'pol_privacy_1_str' => 'id elemento web1'} => 'RBTXPRIXConsensoA0',
      {'pol_privacy_2_str' => 'id elemento web2'} => 'RBTXPRIXConsensoB0',
      {'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'N'} => 'RBTXDCOXEspUnoDueCond1',
      {'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'S'} => 'RBTXDCOXEspUnoDueCond0',
      {'pol_subscriber_is_driver_str' => 'si'} => '/html/body/form[2]/div/div/div[2]/div[4]/div[3]/div/div[2]/div[2]/div/div/div/div/img',
      {'pol_cohabiting_children_str' => 'si'} => 'RBTXDCOXFigli0',
      {'pol_privacy_3_str' => 'id elemento web3'} => 'RBTXPRIXConsensoC0',
      {'pol_bersani_ref_vehicle_insured_with_company_str' => 'no'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div[2]/div[2]/div[4]/div[2]/div/div[2]/div/div/img',
      {'pol_bersani_str' => 'no'} => 'RBTXDPOXBersani1',
      {'pol_bersani_str' => 'convivente'} => 'RBTXDPOXBersani0',
      {'pol_bersani_str' => 'veicolo'} => 'RBTXDPOXBersani0',
      {'pol_current_policy_guarantee_str' => 'nessuna'} => 'CHXXDPOXNessunaGaranzia',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo nuovo'} => 'RBTXDPOXSituazione1',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo usato'} => 'RBTXDPOXSituazione2',
      {'pol_insurance_situation_str' => 'veicolo gia\' assicurato con atr'} => 'RBTXDPOXSituazione0',
      {'pol_leasing_str' => 'no'} => 'RBTXDPOXLeasing1',
      {'pol_subscriber_is_owner_str' => 'no'} => 'RBTXDP1XProprietarioContraente1',
      {'pol_subscriber_is_owner_str' => 'si'} => 'RBTXDP1XProprietarioContraente0',
      {'pol_client_type_str' => 'persona giuridica'} => 'RBTXDP1XContraente1',
      {'driv_driver_sex_str' => 'F'} => 'RBTXDP3XSessoMF1',
      {'pol_client_type_str' => 'persona fisica'} => 'RBTXDP1XContraente0',
      {'driv_driver_sex_str' => 'M'} => 'RBTXDP3XSessoMF0',
      {'own_owner_sex_str' => 'M'} => 'RBTXDP1XSessoMF0',
      {'own_owner_sex_str' => 'F'} => 'RBTXDP1XSessoMF1',

      {'pol_instalment_str' => 'annuale'} => 'annuale',
      {'veh_fuel_str' => 'B'} => 'Benzina',
      {'veh_fuel_str' => 'D'} => 'Diesel',
      {'veh_fuel_str' => 'G'} => 'GPL/Metano',
      {'veh_fuel_str' => 'M'} => 'GPL/Metano',
      {'veh_alarm_str' => 'immobilizer'} => 'Immobilizzatore senza allarme',
      {'pol_BM_1_more_than_1_year_str' => 'si'} => 'RBTXDPOXClasseUnoDomanda0',
      {'pol_BM_1_more_than_1_year_str' => 'no'} => 'RBTXDPOXClasseUnoDomanda1',

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
      {'own_owner_residence_province_str' => 'AG'} => 'AGRIGENTO',
      {'own_owner_residence_province_str' => 'AL'} => 'ALESSANDRIA',
      {'own_owner_residence_province_str' => 'AN'} => 'ANCONA',
      {'own_owner_residence_province_str' => 'AO'} => 'AOSTA',
      {'own_owner_residence_province_str' => 'AR'} => 'AREZZO',
      {'own_owner_residence_province_str' => 'AP'} => 'ASCOLI PICENO',
      {'own_owner_residence_province_str' => 'AT'} => 'ASTI',
      {'own_owner_residence_province_str' => 'AV'} => 'AVELLINO',
      {'own_owner_residence_province_str' => 'BA'} => 'BARI',
      {'own_owner_residence_province_str' => 'BT'} => 'BARLETTA ANDRIA TRANI',
      {'own_owner_residence_province_str' => 'BL'} => 'BELLUNO',
      {'own_owner_residence_province_str' => 'BN'} => 'BENEVENTO',
      {'own_owner_residence_province_str' => 'BG'} => 'BERGAMO',
      {'own_owner_residence_province_str' => 'BI'} => 'BIELLA',
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

    }

  end

  def build_hash_sect_2()

    @target_values = {}

    @target_values = {

      {'driv_job_2_str' => 'campo tecnico per genertel'} => 'index 1',
      {'own_owner_sex_str' => 'M'} => 'RBTXDP1XSessoMF0',
      {'own_owner_sex_str' => 'F'} => 'RBTXDP1XSessoMF1',
      {'pol_bersani_ref_vehicle_insured_with_company_str' => 'no'} => '/html/body/form[3]/div/div/div[2]/div[4]/div[4]/div[2]/div[2]/div[4]/div[2]/div/div[2]/div/div/img',
      {'pol_bersani_str' => 'no'} => 'RBTXDPOXBersani0',
      {'pol_bersani_str' => 'convivente'} => 'RBTXDPOXBersani1',
      {'pol_bersani_str' => 'veicolo'} => 'RBTXDPOXBersani1',
      {'pol_BM_assigned_str' => '-1'} => '1',
      {'pol_BM_assigned_str' => '1'} => '1',
      {'pol_coming_from_BM_str' => '-1'} => '1',
      {'pol_coming_from_BM_str' => '1'} => '1',
      {'pol_BM_assigned_str' => '2'} => '2',
      {'pol_coming_from_BM_str' => '2'} => '2',
      {'pol_BM_assigned_str' => '3'} => '3',
      {'pol_coming_from_BM_str' => '3'} => '3',
      {'pol_BM_assigned_str' => '4'} => '4',
      {'pol_coming_from_BM_str' => '4'} => '4',
      {'pol_BM_assigned_str' => '5'} => '5',
      {'pol_coming_from_BM_str' => '5'} => '5',
      {'pol_BM_assigned_str' => '6'} => '6',
      {'pol_coming_from_BM_str' => '6'} => '6',
      {'pol_BM_assigned_str' => '7'} => '7',
      {'pol_coming_from_BM_str' => '7'} => '7',
      {'pol_BM_assigned_str' => '8'} => '8',
      {'pol_coming_from_BM_str' => '8'} => '8',
      {'pol_BM_assigned_str' => '9'} => '9',
      {'pol_coming_from_BM_str' => '9'} => '9',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_coming_from_BM_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_coming_from_BM_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_coming_from_BM_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_coming_from_BM_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_coming_from_BM_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_coming_from_BM_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_coming_from_BM_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_coming_from_BM_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_coming_from_BM_str' => '18'} => '18',
      {'pol_client_type_str' => 'persona giuridica'} => 'RBTXDP1XContraente0',
      {'pol_client_type_str' => 'persona fisica'} => 'RBTXDP1XContraente1',
      {'pol_cohabiting_children_str' => 'si'} => 'RBTXDCOXFigli1',
      {'pol_current_policy_guarantee_str'  => 'id elemento'} => 'RBTXDPOXIncendioFurto1',
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'Amici/parenti',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'RBTXDPOXSituazione0',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => '(profilefield[:veh_new_used_vehicle_str] == "U") ? "RBTXDPOXSituazione2" : "RBTXDPOXSituazione1"',
      {'pol_leasing_str' => 'no'} => 'RBTXDPOXLeasing1',
      {'pol_payment_str' => 'carta di credito'} => '',
      {'pol_privacy_1_str' => 'id elemento web1'} => 'RBTXPRIXConsensoA0',
      {'pol_privacy_2_str' => 'id elemento web2'} => 'RBTXPRIXConsensoB0',
      {'pol_privacy_3_str' => 'id elemento web3'} => 'RBTXPRIXConsensoC0',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '€ 3,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '€ 6,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '€ 10,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '€ 10,000,000.00',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '€ 10,000,000.00',
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
      {'veh_alarm_str' => 'nessuno'} => 'Nessun antifurto',
      {'veh_vehicle_shelter_str' => 'box privato'} => 'RBTXDVEXCustodia0',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato',

      {'pol_driver_accident_coverage_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX5X5',
      {'pol_legal_assistance_web_id_str'  => 'id elemento'} => 'GRDXGARXGaranzieX4X5',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'LBLXRIEXImporto',
      {'pol_road_assistance_web_id_str' => 'id elemento'} => 'GRDXGARXGaranzieX3X5',
      {'pol_theft_fire_coverage_web_id_str'  => 'id elemento'} => 'GRDXGARXGaranzieX8X5',

    }
  
  end

end