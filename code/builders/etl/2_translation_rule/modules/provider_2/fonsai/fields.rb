module Provider2Fonsai

  
  def build_hash_sect_1()

    @target_values = {}

    @target_values = {
      {'pol_risk_certificate_str' => 'si'} => '/html/body/form/div/div[2]/div/div[2]/div/div[4]/div[2]/span',
      {'pol_bersani_str' => 'No'} => '/html/body/form/div/div[2]/div/div[2]/div/div[9]/div[2]/span[2]',
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
      {'pol_coming_from_BM_num' => '-1'} => '1',
      {'pol_coming_from_BM_num' => '1'} => '1',
      {'pol_coming_from_BM_num' => '2'} => '2',
      {'pol_coming_from_BM_num' => '3'} => '3',
      {'pol_coming_from_BM_num' => '4'} => '4',
      {'pol_coming_from_BM_num' => '5'} => '5',
      {'pol_coming_from_BM_num' => '6'} => '6',
      {'pol_coming_from_BM_num' => '7'} => '7',
      {'pol_coming_from_BM_num' => '8'} => '8',
      {'pol_coming_from_BM_num' => '9'} => '9',
      {'pol_coming_from_BM_num' => '10'} => '10',
      {'pol_coming_from_BM_num' => '11'} => '11',
      {'pol_coming_from_BM_num' => '12'} => '12',
      {'pol_coming_from_BM_num' => '13'} => '13',
      {'pol_coming_from_BM_num' => '14'} => '14',
      {'pol_coming_from_BM_num' => '15'} => '15',
      {'pol_coming_from_BM_num' => '16'} => '16',
      {'pol_coming_from_BM_num' => '17'} => '17',
      {'pol_coming_from_BM_num' => '18'} => '18',
      {'pol_public_liability_exemption_str' => 'no'} => 'nessuna',
      {'veh_tow_hook_str' => 'no'} => '/html/body/form/div/div[2]/div/div[2]/div/div[13]/div[2]/span[2]',
      {'veh_gprs_str' => 'no'} => '/html/body/form/div/div[2]/div/div[2]/div/div[14]/div[2]/span[2]',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '3000000',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '25000000',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '15000000',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '10329137,98',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '5164568,99',
      {'pol_nr_of_paid_claims_1_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_1_yr_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_2_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_2_yr_str' => '1'} => '1',

      {'pol_nr_of_paid_claims_3_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_3_yr_str' => '1'} => '1',

      {'pol_nr_of_paid_claims_4_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_4_yr_str' => '1'} => '1',

      {'pol_nr_of_paid_claims_5_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_5_yr_str' => '1'} => '1',

      {'pol_nr_of_paid_claims_this_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_this_yr_str' => '1'} => '1',

      {'pol_partner_garages_str' => 'no'} => '/html/body/form/div/div[2]/div/div[2]/div/div[9]/div/span[2]',
      {'own_owner_sex_str' => 'M'} => 'Uomo',
      {'own_owner_sex_str' => 'F'} => 'Donna',
      {'pol_insurance_situation_str' => 'veicolo gi\'a assicurato con atr'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a polizza dopo l\'acquisto del veicolo'} => 'Prima polizza',
      {'pol_type_of_contract_str' => 'bonus/malus'} => 'Personalizzata Unica',
      {'pol_property_type_to_be_insured_str' => 'autovettura'} => 'Autovetture',
      {'veh_vehicle_type_str' => 'autovettura'} => 'Autovettura',
      {'own_owner_sex_str' => 'M'} => 'Persona fisica',
      {'own_owner_sex_str' => 'F'} => 'Persona fisica',
      {'own_owner_sex_str' => 'C'} => 'Persona giuridica',
      {'pol_driving_type_str' => 'definita'} => 'Conducente esperto',
      {'pol_driving_type_str' => 'libera'} => 'Qualunque conducente - soggetti diversi dalle persone fisiche',
#      {'pol_driving_type_str' => 'esclusiva se guidat <25 anni'} => 'Conducente esclusivo con età fino a 25 anni',
#      {'pol_driving_type_str' => 'esclusiva se guidat >26 anni'} => 'Conducente esclusivo con età da 26 anni',
#      {'veh_vehicle_use_str' => 'privato'} => 'Privato',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'premio',


    }
  end
  









  def build_hash_sect_2()

    @target_values = {}

    @target_values = {

      {'own_owner_sex_str' => 'M'} => 'Uomo',
      {'own_owner_sex_str' => 'F'} => 'Donna',
      {'pol_bersani_str' => 'si'} => 'bersaniY',
      {'pol_bersani_str' => 'no'} => 'bersaniN',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '1',
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
      {'pol_coming_from_BM_str' => '1 da almeno 1 anno'} => '1',
      {'pol_coming_from_BM_str' => '1'} => '1',
      {'pol_coming_from_BM_str' => '2'} => '2',
      {'pol_coming_from_BM_str' => '3'} => '3',
      {'pol_coming_from_BM_str' => '4'} => '4',
      {'pol_coming_from_BM_str' => '5'} => '5',
      {'pol_coming_from_BM_str' => '6'} => '6',
      {'pol_coming_from_BM_str' => '7'} => '7',
      {'pol_coming_from_BM_str' => '8'} => '8',
      {'pol_coming_from_BM_str' => '9'} => '9',
      {'pol_coming_from_BM_str' => '10'} => '10',
      {'pol_coming_from_BM_str' => '11'} => '11',
      {'pol_coming_from_BM_str' => '12'} => '12',
      {'pol_coming_from_BM_str' => '13'} => '13',
      {'pol_coming_from_BM_str' => '14'} => '14',
      {'pol_coming_from_BM_str' => '15'} => '15',
      {'pol_coming_from_BM_str' => '16'} => '16',
      {'pol_coming_from_BM_str' => '17'} => '17',
      {'pol_coming_from_BM_str' => '18'} => '18',
      {'pol_coming_from_familiar_risk_certificate_str' => 'attest rilasc altra com'} => 'attRisk_A',
      {'pol_insurance_situation_str' => 'veicolo già assicurato con atr'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione dopo l’acquisto del veicolo'} => 'Prima polizza',
      {'pol_property_type_to_be_insured_str' => 'motociclo'} => 'Motoveicoli per trasporto persone',
      {'pol_public_liability_exemption_str' => '0 Euro'} => 'nessuna',
      {'pol_public_liability_exemption_str' => '250 Euro'} => '€ 258,00',
      {'pol_public_liability_exemption_str' => '500 Euro'} => '€ 361,00',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '€ 2.500.000 - 775.000',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '€ 3.615.198,29',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '€ 5.164.568,99',
      {'pol_public_liability_indemnity_limit_str' => '8,000,000'} => '€ 8.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '€ 10.329.137,98',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '€ 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '20,000,000'} => '€ 20.658.275,96',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '€ 25.822.844,95',
      {'pol_RCA_premium_id_str' => 'id_elemento'} => '//*[@id="premio"]',
      {'veh_passenger_transportation_str' => 'Y'} => 'passegY',
      {'veh_passenger_transportation_str' => 'N'} => 'passegN',
      {'veh_vehicle_type_str' => 'benzina'} => 'Motore a scoppio',
      {'veh_vehicle_type_str' => 'motociclo'} => 'Motociclo',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato',

    }

  end

  def build_hash_sect_3()

    @target_values = {}

    @target_values = {

      {'own_owner_sex_str' => 'M'} => 'Uomo',
      {'own_owner_sex_str' => 'F'} => 'Donna',
      {'pol_bersani_str' => 'si'} => 'bersaniY',
      {'pol_bersani_str' => 'no'} => 'bersaniN',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '1',
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
      {'pol_coming_from_BM_str' => '1 da almeno 1 anno'} => '1',
      {'pol_coming_from_BM_str' => '1'} => '1',
      {'pol_coming_from_BM_str' => '2'} => '2',
      {'pol_coming_from_BM_str' => '3'} => '3',
      {'pol_coming_from_BM_str' => '4'} => '4',
      {'pol_coming_from_BM_str' => '5'} => '5',
      {'pol_coming_from_BM_str' => '6'} => '6',
      {'pol_coming_from_BM_str' => '7'} => '7',
      {'pol_coming_from_BM_str' => '8'} => '8',
      {'pol_coming_from_BM_str' => '9'} => '9',
      {'pol_coming_from_BM_str' => '10'} => '10',
      {'pol_coming_from_BM_str' => '11'} => '11',
      {'pol_coming_from_BM_str' => '12'} => '12',
      {'pol_coming_from_BM_str' => '13'} => '13',
      {'pol_coming_from_BM_str' => '14'} => '14',
      {'pol_coming_from_BM_str' => '15'} => '15',
      {'pol_coming_from_BM_str' => '16'} => '16',
      {'pol_coming_from_BM_str' => '17'} => '17',
      {'pol_coming_from_BM_str' => '18'} => '18',
      {'pol_coming_from_familiar_risk_certificate_str' => 'attest rilasc altra com'} => 'attRisk_A',
      {'pol_insurance_situation_str' => 'veicolo già assicurato con atr'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione dopo l’acquisto del veicolo'} => 'Prima polizza',
      {'pol_property_type_to_be_insured_str' => 'ciclomotore'} => 'Ciclomotori o Quadricicli leggeri per trasporto persone',
      {'pol_public_liability_exemption_str' => '0 Euro'} => 'nessuna',
      {'pol_public_liability_exemption_str' => '250 Euro'} => '€ 258,00',
      {'pol_public_liability_exemption_str' => '500 Euro'} => '€ 361,00',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '€ 2.500.000 - 775.000',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '€ 3.615.198,29',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '€ 5.164.568,99',
      {'pol_public_liability_indemnity_limit_str' => '8,000,000'} => '€ 8.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '€ 10.329.137,98',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '€ 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '20,000,000'} => '€ 20.658.275,96',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '€ 25.822.844,95',
      {'pol_RCA_premium_id_str' => 'id_elemento'} => '//*[@id="premio"]',
      {'veh_passenger_transportation_str' => 'Y'} => 'passegY',
      {'veh_passenger_transportation_str' => 'N'} => 'passegN',
      {'veh_vehicle_type_str' => 'ciclomotore'} => 'Ciclomotore',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato'

    }

  end

  def build_hash_sect_4()

    @target_values = {}

    @target_values = {

      {'own_owner_sex_str' => 'M'} => 'Uomo',
      {'own_owner_sex_str' => 'F'} => 'Donna',
      {'pol_bersani_str' => 'si'} => 'bersaniY',
      {'pol_bersani_str' => 'no'} => 'bersaniN', {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '1',
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
      {'pol_coming_from_BM_str' => '1 da almeno 1 anno'} => '1',
      {'pol_coming_from_BM_str' => '1'} => '1',
      {'pol_coming_from_BM_str' => '2'} => '2',
      {'pol_coming_from_BM_str' => '3'} => '3',
      {'pol_coming_from_BM_str' => '4'} => '4',
      {'pol_coming_from_BM_str' => '5'} => '5',
      {'pol_coming_from_BM_str' => '6'} => '6',
      {'pol_coming_from_BM_str' => '7'} => '7',
      {'pol_coming_from_BM_str' => '8'} => '8',
      {'pol_coming_from_BM_str' => '9'} => '9',
      {'pol_coming_from_BM_str' => '10'} => '10',
      {'pol_coming_from_BM_str' => '11'} => '11',
      {'pol_coming_from_BM_str' => '12'} => '12',
      {'pol_coming_from_BM_str' => '13'} => '13',
      {'pol_coming_from_BM_str' => '14'} => '14',
      {'pol_coming_from_BM_str' => '15'} => '15',
      {'pol_coming_from_BM_str' => '16'} => '16',
      {'pol_coming_from_BM_str' => '17'} => '17',
      {'pol_coming_from_BM_str' => '18'} => '18',
      {'pol_coming_from_familiar_risk_certificate_str' => 'attest rilasc altra com'} => 'attRisk_A',
      {'pol_insurance_situation_str' => 'veicolo già assicurato con atr'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione dopo l’acquisto del veicolo'} => 'Prima polizza',
      {'pol_property_type_to_be_insured_str' => 'autocarro per trasporto persone o cose'} => 'Autocarri o Autoveicoli per trasporto cose',
      {'pol_public_liability_exemption_str' => '0 Euro'} => 'nessuna',
      {'pol_public_liability_exemption_str' => '250 Euro'} => '€ 258,00',
      {'pol_public_liability_exemption_str' => '500 Euro'} => '€ 361,00',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '€ 2.500.000 - 775.000',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '€ 3.615.198,29',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '€ 5.164.568,99',
      {'pol_public_liability_indemnity_limit_str' => '8,000,000'} => '€ 8.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '€ 10.329.137,98',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '€ 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '20,000,000'} => '€ 20.658.275,96',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '€ 25.822.844,95',
      {'pol_RCA_premium_id_str' => 'id_elemento'} => '//*[@id="premio"]',
      {'veh_hook_str' => 'no'} => 'noleggioN',
      {'veh_rent_str' => 'no'} => 'trainoN',
      {'veh_third_party_str' => 'Conto proprio'} => 'Conto proprio',
      {'veh_third_party_str' => 'Conto terzi'} => 'Conto terzi',
      {'veh_vehicle_type_str' => 'autocarro per trasporto persone o cose'} => 'Autocarro',
      {'veh_vehicle_use_str' => 'privato'} => 'Altro / non presente in lista (escluse sostanze radioattive)',

    }

  end

end