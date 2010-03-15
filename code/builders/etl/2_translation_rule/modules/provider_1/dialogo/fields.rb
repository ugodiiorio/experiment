#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Provider1Dialogo
  # da correggere il file di mara con gli input anziche gli x path
  def build_hash_sect_1()

    #     target_values["fname_fvalue"]

    @target_values = Hash.new

    @target_values = {
      {'pol_assistance_web_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:1:_id147',
      {'pol_driver_accident_coverage_web_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:3:_id147',
      {'pol_easy_driver_web_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:7:_id147',
      {'pol_glasses_web_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:6:_id147',
      {'pol_legal_assistance_web_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:2:_id147',
      {'pol_assistance_web_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:5:_id147',
      {'pol_assistance_web_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:4:_id147',

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
      {'own_owner_residence_province_str' => 'BI'} => 'BIELLA',
      {'own_owner_residence_province_str' => 'BO'} => 'BOLOGNA',
      {'own_owner_residence_province_str' => 'BZ'} => 'BOLZANO',
      {'own_owner_residence_province_str' => 'BS'} => 'BRESCIA',
      {'own_owner_residence_province_str' => 'BR'} => 'BRINDISI',
      {'own_owner_residence_province_str' => 'CA'} => 'CAGLIARI',
      {'own_owner_residence_province_str' => 'CL'} => 'CALTANISSETTA',
      {'own_owner_residence_province_str' => 'CB'} => 'CAMPOBASSO',
      {'own_owner_residence_province_str' => 'CI'} => 'CARBONIA-IGLESIAS',
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
      {'own_owner_residence_province_str' => 'FC'} => 'FORLI\'-CESENA',
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
      {'own_owner_residence_province_str' => 'MS'} => 'MASSA-CARRARA',
      {'own_owner_residence_province_str' => 'MT'} => 'MATERA',
      {'own_owner_residence_province_str' => 'ME'} => 'MESSINA',
      {'own_owner_residence_province_str' => 'MI'} => 'MILANO',
      {'own_owner_residence_province_str' => 'MO'} => 'MODENA',
      {'own_owner_residence_province_str' => 'MB'} => 'MONZA E DELLA BRIANZA',
      {'own_owner_residence_province_str' => 'NA'} => 'NAPOLI',
      {'own_owner_residence_province_str' => 'NO'} => 'NOVARA',
      {'own_owner_residence_province_str' => 'NU'} => 'NUORO',
      {'own_owner_residence_province_str' => 'OT'} => 'OLBIA-TEMPIO',
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
      {'pol_bersani_str' => 'veicolo'} => '/html/body/div/div[3]/div/form/fieldset/div[3]/div/div/table/tbody/tr/td/label/input',
      {'pol_driver_is_owner_str' => 'no'} => '/html/body/div/div[3]/div/form/span[2]/fieldset/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/label/input',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '€ 10.000.000,00 - € 10.000.000,00 - € 10.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '€ 15.000.000,00 - € 15.000.000,00 - € 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '€ 25.000.000,00 - € 25.000.000,00 - € 25.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '€ 3.000.000,00 - € 3.000.000,00 - € 3.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '€ 5.000.000,00 - € 5.000.000,00 - € 5.000.000,00',
      {'pol_BM_assigned_str' => '-1'} => '1 da almeno un anno',
      {'pol_insurance_situation_str' => 'veicolo gi\' assicurato con atr'} => '//input[@name=contentSubView:contentForm:attualeSituazione and @value="3"]',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo nuovo'} => '//input[@name=contentSubView:contentForm:attualeSituazione and @value="1"]',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo usato'} => '//input[@name=contentSubView:contentForm:attualeSituazione and @value="2"]',
      {'pol_bersani_str' => 'convivente'} => 'contentSubView:contentForm:bonusMalusRadio',
      {'pol_bersani_str' => 'no'} => 'contentSubView:contentForm:bonusMalusRadio',
      {'pol_driving_type_str' => 'esperta'} => 'contentSubView:contentForm:chooseAuto:casoAss',
      {'pol_driving_type_str' => 'libera'} => 'contentSubView:contentForm:chooseAuto:casoAss',
      {'pol_driving_type_str' => 'esclusiva'} => 'contentSubView:contentForm:chooseAuto:casoAss',
      {'veh_num_of_owners_str' => '1'} => 'contentSubView:contentForm:chooseAuto:Cointest',
      {'pol_subscriber_is_driver_str' => 'si'} => 'contentSubView:contentForm:chooseAuto:contrIsDriv',
      {'pol_subscriber_is_driver_str' => 'no'} => 'contentSubView:contentForm:chooseAuto:contrIsDriv',
      {'pol_subscriber_is_owner_str' => 'si'} => 'contentSubView:contentForm:chooseAuto:contrIsOwn',
      {'own_owner_sex_str' => 'M'} => '//input[@name=contentSubView:contentForm:MFRProprietario and @value="M"]',
      {'own_owner_sex_str' => 'F'} => '//input[@name=contentSubView:contentForm:MFRProprietario and @value="F"]',
      {'own_owner_sex_str' => 'C'} => '//input[@name=contentSubView:contentForm:MFRProprietario and @value="E"]',
      {'pol_driver_is_owner_str' => 'si'} => 'contentSubView:contentForm:ProprietarioConducente',
      {'driv_driver_sex_str' => 'M'} => '//input[@name=contentSubView:contentForm:SessoConducente and @value="M"]',
      {'driv_driver_sex_str' => 'F'} => '//input[@name=contentSubView:contentForm:SessoConducente and @value="F"]',
      {'veh_vehicle_use_str' => 'privato'} => 'contentSubView:contentForm:vehicleUsage',
      #      {'pol_assistance_str' => 'TRUE'} => 'contentSubView:quotationTabletForm:proposalTable:1:_id147',
      #      {'pol_legal_assistance_str' => 'TRUE'} => 'contentSubView:quotationTabletForm:proposalTable:2:_id147',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'contentSubView:quotationTabletForm:proposalTable:2:_id147',
      #      {'own_owner_specification_str' => 'M'} => '//input[@name=contentSubView:contentForm:MFRProprietario and @value="M"]',
      #      {'own_owner_specification_str' => 'F'} => '//input[@name=contentSubView:contentForm:MFRProprietario and @value="F"]',
      #      {'own_owner_specification_str' => 'C'} => '//input[@name=contentSubView:contentForm:MFRProprietario and @value="E"]',

      {'pol_instalment_str' => 'annuale'} => 'contentSubView:quotationTabletForm:proposalTable:8:_id147',
      {'pol_instalment_str' => 'semestrale'} => 'contentSubView:quotationTabletForm:proposalTable:9:_id147',
      {'pol_number_plate_type_str' => 'definitiva'} => 'contentSubView:vehicleForm:foreignRegistration',
      {'veh_vehicle_shelter_str' => 'box privato'} => 'contentSubView:vehicleForm:garage',
      {'veh_tow_hook_str' => 'no'} => 'contentSubView:vehicleForm:hook',
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'Passaparola'
      
    }











































    #  costruisci hash ["field_name + field_value","target"]
  end


end