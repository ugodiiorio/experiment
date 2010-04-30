module Provider2Fonsai

  def build_hash_sect_1()

    @target_values = {}

    @target_values = {

      {'own_owner_sex_str' => 'M'} => 'Uomo',
      {'own_owner_sex_str' => 'F'} => 'Donna',
      {'pol_risk_certificate_str' => 'si'} => 'attRiskY',
      {'pol_bersani_str' => 'no'} => 'bersaniN',
      {'pol_bersani_str' => 'si'} => 'bersaniY',
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
      {'pol_BM_particular_cases_str' => 'no'} => 'Non applicabile',
      {'pol_car_already_insured_with_company_str' => 'no'} => '0',
      {'pol_client_type_str' => 'persona fisica'} => 'Persona fisica',
      {'pol_client_type_str' => 'persona giuridica'} => 'Persona giuridica',
      {'pol_coming_from_BM_str' => '-1'} => '1',
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
      {'pol_coming_from_company_str' => 'generali'} => 'attRisk_A',
      {'pol_public_liability_exemption_str' => '0'} => 'nessuna',
      {'veh_tow_hook_str' => 'no'} => 'trainoN',
      {'veh_gprs_str' => 'no'} => 'boxGprsN',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '€ 3.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3,615,198'} => '€ 3.615.198,29',
      {'pol_public_liability_indemnity_limit_str' => '5,164,569'} => '€ 5.164.568,99',
      {'pol_public_liability_indemnity_limit_str' => '7,746,853'} => '€ 7.746.853.49',
      {'pol_public_liability_indemnity_limit_str' => '8,000,000'} => '€ 8.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '€ 10.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,329,138'} => '€ 10.329.137,98',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '€ 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '€ 25.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '25,822,844'} => '€ 25.822.844,95',
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
      {'pol_partner_garages_str' => 'no'} => 'autoPrestoBeneN',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima polizza',
      {'pol_type_of_contract_str' => 'bonus/malus'} => 'Personalizzata Unica',
      {'pol_property_type_to_be_insured_str' => 'autovettura'} => 'Autovetture',
      {'veh_vehicle_type_str' => 'autovettura'} => 'Autovettura',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'premio',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato',

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
      {'pol_car_already_insured_with_company_str' => 'no'} => '0',
      {'pol_client_type_str' => 'persona fisica'} => 'Persona fisica',
      {'pol_client_type_str' => 'persona giuridica'} => 'Persona giuridica',
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
      {'pol_coming_from_company_str' => 'Generali'} => 'attRisk_A',
      {'pol_risk_certificate_str' => 'si'} => 'attRiskY',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima polizza',
      {'pol_property_type_to_be_insured_str' => 'motociclo'} => 'Motoveicoli per trasporto persone',
      {'pol_public_liability_exemption_str' => '0'} => 'nessuna',
      {'pol_public_liability_exemption_str' => '129'} => '€ 129,00',
      {'pol_public_liability_exemption_str' => '258'} => '€ 258,00',
      {'pol_public_liability_exemption_str' => '516'} => '€ 516,00',
      {'pol_public_liability_exemption_str' => '774'} => '€ 774,00',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '€ 3.500.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3,500,000'} => '€ 3.500.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3,615,198'} => '€ 3.615.198,29',
      {'pol_public_liability_indemnity_limit_str' => '5,164,568'} => '€ 5.164.568,99',
      {'pol_public_liability_indemnity_limit_str' => '7,746,853'} => '€ 7.746.853.49',
      {'pol_public_liability_indemnity_limit_str' => '8,000,000'} => '€ 8.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '€ 10.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,329,137'} => '€ 10.329.137,98',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '€ 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '€ 25.000.000,96',
      {'pol_public_liability_indemnity_limit_str' => '25,822,844'} => '€ 25.822.844,95',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//*[@id="premio"]',
      {'veh_passenger_transportation_str' => 'si'} => 'passegY',
      {'veh_passenger_transportation_str' => 'no'} => 'passegN',
      {'veh_fuel_str' => 'benzina'} => 'Motore a scoppio',
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
      {'pol_BM_particular_cases_str' => 'no'} => 'Non applicabile',
      {'pol_client_type_str' => 'persona fisica'} => 'Persona fisica',
      {'pol_client_type_str' => 'persona giuridica'} => 'Persona giuridica',
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
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima polizza',
      {'pol_property_type_to_be_insured_str' => 'ciclomotore'} => 'Ciclomotori o Quadricicli leggeri per trasporto persone',
      {'pol_public_liability_exemption_str' => '0'} => 'nessuna',
      {'pol_public_liability_exemption_str' => '258'} => '€ 258,00',
      {'pol_public_liability_exemption_str' => '361'} => '€ 361,00',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '€ 3.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3,500,000'} => '€ 3.500.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3,615,198'} => '€ 3.615.198,29',
      {'pol_public_liability_indemnity_limit_str' => '5,164,569'} => '€ 5.164.568,99',
      {'pol_public_liability_indemnity_limit_str' => '8,000,000'} => '€ 8.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '€ 10.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,329,138'} => '€ 10.329.137,98',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '€ 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '€ 25.000.000,96',
      {'pol_public_liability_indemnity_limit_str' => '25,822,844'} => '€ 25.822.844,95',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//*[@id="premio"]',
      {'veh_passenger_transportation_str' => 'si'} => 'passegY',
      {'veh_passenger_transportation_str' => 'no'} => 'passegN',
      {'veh_vehicle_type_str' => 'ciclomotore'} => 'Ciclomotore',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato'

    }

  end

  def build_hash_sect_4()

    @target_values = {}

    @target_values = {

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
      {'pol_BM_particular_cases_str' => 'no'} => 'Non applicabile',
      {'pol_BM_in_risk_certificate_str' => 'si'} => 'precFormaTariffY',
      {'pol_client_type_str' => 'persona giuridica'} => 'Persona giuridica',
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
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Già assicurato con altra compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima polizza',
      {'pol_property_type_to_be_insured_str' => 'autocarro per trasporto persone o cose'} => 'Autocarri o Autoveicoli per trasporto cose',
      {'pol_public_liability_exemption_str' => '0'} => 'nessuna',
      {'pol_public_liability_exemption_str' => '129'} => '€ 129,00',
      {'pol_public_liability_exemption_str' => '258'} => '€ 258,00',
      {'pol_public_liability_exemption_str' => '516'} => '€ 516,00',
      {'pol_public_liability_exemption_str' => '774'} => '€ 774,00',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000.00'} => '€ 3.500.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3,500,000.00'} => '€ 3.500.000,00',
      {'pol_public_liability_indemnity_limit_str' => '3,615,198.29'} => '€ 3.615.198,29',
      {'pol_public_liability_indemnity_limit_str' => '5,164,568.99'} => '€ 5.164.568,99',
      {'pol_public_liability_indemnity_limit_str' => '7,746,853.49'} => '€ 7.746.853.49',
      {'pol_public_liability_indemnity_limit_str' => '8,000,000.00'} => '€ 8.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000.00'} => '€ 10.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '10,329,137.98'} => '€ 10.329.137,98',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000.00'} => '€ 15.000.000,00',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000.00'} => '€ 25.000.000,96',
      {'pol_public_liability_indemnity_limit_str' => '25,822,844.45'} => '€ 25.822.844,95',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//*[@id="premio"]',
      {'veh_hook_str' => 'no'} => 'trainoN',
      {'veh_rent_str' => 'no'} => 'noleggioN',
      {'veh_third_party_str' => 'conto proprio'} => 'Conto proprio',
      {'veh_third_party_str' => 'conto terzi'} => 'Conto terzi',
      {'veh_vehicle_type_str' => 'autocarro per trasporto persone o cose'} => 'Autocarro',
      {'veh_vehicle_use_str' => 'privato'} => 'Altro / non presente in lista (escluse sostanze radioattive)',

    }

  end

end