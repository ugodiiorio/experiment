module Provider2Axa

  def build_hash_sect_1()

    @target_values = {}

    @target_values = {
      
      {'pol_public_liability_exemption_str' => 'no'} => '0 Euro',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'veh_tow_hook_str' => 'no'} => '//input[@name="TRAINO" and @value="0"]',
      {'pol_defined_drive_str' => 'si'} => '//input[@name="_RCA17" and @value="1"]',
      {'pol_defined_drive_str' => 'no'} => '//input[@name="_RCA17" and @value="0"]',
      {'pol_exclusive_drive_str' => 'si'} => '//input[@name="_RCA18" and @value="1"]',
      {'pol_exclusive_drive_str' => 'no'} => '//input[@name="_RCA18" and @value="0"]',
      {'pol_renounce_compensation_str' => 'no'} => '//input[@name="_RCA03" and @value="0"]',

      {'pol_public_liability_indemnity_limit_str' => '800000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '1600000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '2500000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '5000000'} => '6,000,000 € - 5,000,000 € - 1,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '6,000,000 € - 6,000,000 € - 6,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '15,000,000 € - 15,000,000 € - 15,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '20,000,000 € - 20,000,000 € - 20,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '25,000,000 € - 25,000,000 € - 25,000,000 €',

      {'own_owner_sex_str' => 'M'} => 'Maschio',
      {'own_owner_sex_str' => 'F'} => 'Femmina',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Il contraente presenta l\'attestato di rischio',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Veicolo immatricolato per 1^ volta al P.R.A.',
      {'pol_type_of_contract_str' => 'bonus/malus'} => 'Bonus/Malus',
      {'pol_number_plate_type_str' => 'definitiva'} => 'Definitiva',
      {'pol_property_type_to_be_insured_str' => 'autovettura'} => 'Autovettura',
      {'veh_vehicle_type_str' => 'autovettura'} => 'Autovettura',
      {'pol_client_type_str' => 'persona fisica'} => '//input[@name="PFIS" and @value="1"]',
      {'pol_client_type_str' => 'persona giuridica'} => '//input[@name="PFIS" and @value="0"]',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/form/div[2]/div/div[5]/div/table/tbody/tr[3]/td[4]',

    }

end

def build_hash_sect_2()

  @target_values = {}

  @target_values = {

    {'driv_driving_experience_str' => 'si'} => 'Sì',
      {'driv_driving_experience_str' => 'no'} => 'No',
      {'own_owner_sex_str' => 'M'} => 'Maschio',
      {'own_owner_sex_str' => 'F'} => 'Femmina',
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
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Il contraente presenta l\'attestato di rischio',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Veicolo immatricolato per 1^ volta al P.R.A.',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_property_type_to_be_insured_str' => 'motociclo'} => 'Motociclo',
      {'pol_public_liability_exemption_str' => '0 Euro'} => '0 Euro',
      {'pol_public_liability_exemption_str' => '500 Euro'} => '500 Euro',
      {'pol_public_liability_exemption_str' => '250 Euro'} => '250 Euro',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10,000,000 € - 10,000,000 € - 10,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '6,000,000 € - 5,000,000 € - 1,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6,000,000 € - 6,000,000 € - 6,000,000 €',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'pol_second_driver_str' => 'no'} => 'No',
      {'veh_fuel_str' => 'benzina'} => 'Benzina',
      {'veh_vehicle_type_str' => 'motociclo'} => 'Motociclo'

  }

end
  
def build_hash_sect_3()

  @target_values = {}

  @target_values = {
      
    {'own_owner_sex_str' => 'M'} => 'Maschio',
      {'own_owner_sex_str' => 'F'} => 'Femmina',
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
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Il contraente presenta l\'attestato di rischio',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Veicolo immatricolato per 1^ volta al P.R.A.',
      {'pol_property_type_to_be_insured_str' => 'ciclomotore'} => 'Ciclomotore',
      {'pol_public_liability_exemption_str' => '0 Euro'} => '0 Euro',
      {'pol_public_liability_exemption_str' => '500 Euro'} => '500 Euro',
      {'pol_public_liability_exemption_str' => '250 Euro'} => '250 Euro',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10,000,000 € - 10,000,000 € - 10,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '6,000,000 € - 5,000,000 € - 1,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6,000,000 € - 6,000,000 € - 6,000,000 €',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'veh_vehicle_type_str' => 'ciclomotore'} => 'Ciclomotore',
      {'veh_fuel_str' => 'benzina'} => 'Benzina'

  }

end

def build_hash_sect_4()

  @target_values = {}

  @target_values = {

    {'pol_client_type_str' => 'C'} => '/html/body/form/table/tbody/tr/td[2]/div/div[2]/table[3]/tbody/tr/td/div/table/tbody/tr[3]/th/div[2]/input',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Il contraente presenta l\'attestato di rischio',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Veicolo immatricolato per 1^ volta al P.R.A.',
      {'pol_number_plate_type_str' => 'definitiva'} => 'Definitiva',
      {'pol_pejus_cu_str' => '0%'} => '0%',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '6,000,000 € - 5,000,000 € - 1,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6,000,000 € - 6,000,000 € - 6,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10,000,000 € - 10,000,000 € - 10,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15,000,000 € - 15,000,000 € - 15,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '20,000,000'} => '20,000,000 € - 20,000,000 € - 20,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '25,000,000 € - 25,000,000 € - 25,000,000 €',
      {'pol_property_type_to_be_insured_str' => 'autocarro per trasporto persone o cose'} => 'Autocarro',
      {'pol_quotation_str' => 'fissa'} => 'Fissa',
      {'pol_quotation_str' => 'franchigia'} => 'Franchigia',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'veh_fuel_str' => 'diesel'} => 'Diesel',
      {'veh_hook_str' => 'no'} => 'No',
      {'veh_product_sector_str' => 'Pesca, piscicoltura e servizi connessi'} => 'Pesca, piscicoltura e servizi connessi',
      {'veh_third_party_str' => 'Conto proprio'} => 'Conto proprio (cose)',
      {'veh_third_party_str' => 'Conto terzi'} => 'Conto terzi (cose)',
      {'veh_vehicle_type_str' => 'autocarro per trasporto persone o cose'} => 'Autocarro',

    }

end

end