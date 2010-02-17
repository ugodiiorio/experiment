#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Fields_Linear
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
      {'veh_gas_methane_supply_str' => 'no'} => 'radiogpl2',
      {'veh_alarm_str' => 'immobilizer'} => 'Immobilizer/Elettronico',
      {'pol_bersani_str' => 'Convivente'} => 'situazione3',
      {'pol_bersani_str' => 'Veicolo'} => 'situazione3',
      {'pol_BM_assigned_str' => '-1'} => '1 B/M da almeno un anno',
      {'pol_BM_assigned_str' => '1'} => '1 B/M',
      {'pol_BM_assigned_str' => '2'} => '2 B/M',
      {'pol_BM_assigned_str' => '3'} => '3 B/M',
      {'pol_BM_assigned_str' => '4'} => '4 B/M',
      {'pol_BM_assigned_str' => '5'} => '5 B/M',
      {'pol_BM_assigned_str' => '6'} => '6 B/M',
      {'pol_BM_assigned_str' => '7'} => '7 B/M',
      {'pol_BM_assigned_str' => '8'} => '8 B/M',
      {'pol_BM_assigned_str' => '9'} => '9 B/M',
      {'pol_BM_assigned_str' => '10'} => '10 B/M',
      {'pol_BM_assigned_str' => '11'} => '11 B/M',
      {'pol_BM_assigned_str' => '12'} => '12 B/M',
      {'pol_BM_assigned_str' => '13'} => '13 B/M',
      {'pol_BM_assigned_str' => '14'} => '14 B/M',
      {'pol_BM_assigned_str' => '15'} => '15 B/M',
      {'pol_BM_assigned_str' => '16'} => '16 B/M',
      {'pol_BM_assigned_str' => '17'} => '17 B/M',
      {'pol_BM_assigned_str' => '18'} => '18 B/M',
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'Passaparola',
      {'pol_instalment_str' => 'annuale'} => 'radioAnnuale',
      {'pol_instalment_str' => 'semestrale'} => 'radioSemestrale',
      {'veh_km_per_yr_num' => '15000'} => '10.000 - 20.000',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '6 Mil. - 6 Mil.',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '20 Mil. - 20 Mil.',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '20 Mil. - 20 Mil.',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '6 Mil. - 6 Mil.',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '6 Mil. - 6 Mil.',
      {'pol_nr_of_paid_claims_2_yr_str' => '0'} => 'Nessuno',
      {'pol_nr_of_paid_claims_2_yr_str' => '1'} => 'Uno',
      {'pol_nr_of_paid_claims_2_yr_str' => '2'} => 'Due',
      {'veh_vehicle_shelter_str' => 'box privato'} => 'box1',
      {'pol_claims_total_number_str' => '0'} => 'Nessuno',
      {'pol_claims_total_number_str' => '1'} => 'Uno',
      {'pol_claims_total_number_str' => '2'} => 'Due',
      {'pol_insurance_situation_str' => 'veicolo gi\' assicurato con atr'} => 'situazione1',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo nuovo'} => 'situazione2',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo usato'} => 'situazione2',
      {'pol_driving_type_str' => 'definita'} => 'guida1',
      {'pol_driving_type_str' => 'libera'} => 'guida3',
      {'pol_driving_type_str' => 'esclusiva'} => 'guida2',
      {'pol_client_type_str' => 'M'} => 'tipologia1',
      {'pol_client_type_str' => 'F'} => 'tipologia2',
      {'pol_client_type_str' => 'C'} => 'tipologia4',
      {'veh_vehicle_use_str' => 'privato'} => 'radio5'

    }











































    #  costruisci hash ["field_name + field_value","target"]
  end


end