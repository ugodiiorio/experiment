module Provider2Axa

  def build_hash_sect_1()

    @target_values = {}

    @target_values = {
      
      {'own_owner_sex_str' => 'F'} => 'Femmina',
      {'own_owner_sex_str' => 'M'} => 'Maschio',
      {'pol_client_type_str' => 'persona fisica'} => '//input[@name="PFIS" and @value="1"]',
      {'pol_client_type_str' => 'persona giuridica'} => '//input[@name="PFIS" and @value="0"]',
      {'pol_defined_drive_str' => 'no'} => '//input[@name="_RCA17" and @value="0"]',
      {'pol_defined_drive_str' => 'si'} => '//input[@name="_RCA17" and @value="1"]',
      {'pol_exclusive_drive_str' => 'no'} => '//input[@name="_RCA18" and @value="0"]',
      {'pol_exclusive_drive_str' => 'si'} => '//input[@name="_RCA18" and @value="1"]',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Veicolo immatricolato per 1^ volta al P.R.A.',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Il contraente presenta l\'attestato di rischio',
      {'pol_number_plate_type_str' => 'definitiva'} => 'Definitiva',
      {'pol_property_type_to_be_insured_str' => 'autovettura'} => 'Autovettura',
      {'pol_public_liability_exemption_str' => '0'} => '0 Euro',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => 'regexpi:(10,000,000.*)+(\s)*(10,000,000.*)+(\s)*(10,000,000.*)+(\s)*$',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => 'regexpi:(3,000,000.*)+(\s)*(2,500,000.*)+(\s)*(500,000.*)+(\s)*$',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => 'regexpi:(6,000,000.*)+(\s)*(5,000,000.*)+(\s)*(1,000,000.*)+(\s)*$',
      {'pol_quotation_str' => 'bm'} => 'Bonus/Malus',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//html/body/form/div[2]/div/div[5]/div/table/tbody/tr[3]/td[4]',
      {'pol_renounce_compensation_str' => 'no'} => '//input[@name="_RCA03" and @value="0"]',
      {'veh_fuel_str' => 'benzina'} => 'Benzina',
      {'veh_fuel_str' => 'diesel'} => 'Diesel',
      {'veh_tow_hook_str' => 'no'} => '//input[@name="TRAINO" and @value="0"]',
      {'veh_vehicle_type_str' => 'autovettura'} => 'Autovettura',
      {'veh_vehicle_use_str' => 'privato'} => 'Privato',

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
      {'pol_public_liability_exemption_str' => '0'} => '0 Euro',
      {'pol_public_liability_exemption_str' => '500'} => '500 Euro',
      {'pol_public_liability_exemption_str' => '250'} => '250 Euro',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '10,000,000 € - 10,000,000 € - 10,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '6,000,000 € - 5,000,000 € - 1,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6,000,000 € - 6,000,000 € - 6,000,000 €',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//td[4][@class="valore_cellaPremio"]',
      {'pol_public_liability_young_exemption_str'  => 'no'} => '//input[@name="_RCA11" and @value="0"]',
      {'pol_quotation_str' => 'bm'} => 'Bonus/Malus',
      {'pol_second_driver_str' => 'no'} => 'No',
      {'pol_exclusive_drive_str' => 'si'} => '//input[@name="_RCA18" and @value="1"]',
      {'pol_exclusive_drive_str' => 'no'} => '//input[@name="_RCA18" and @value="0"]',
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
      {'pol_public_liability_exemption_str' => '0'} => '0 Euro',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6,000,000 € - 6,000,000 € - 6,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '10,000,000 € - 10,000,000 € - 10,000,000 €',
      {'pol_public_liability_young_exemption_str'  => 'no'} => '//input[@name="_RCA11" and @value="0"]',
      {'pol_quotation_str' => 'bm'} => 'Bonus/Malus',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//html/body/form/div[2]/div/div[5]/div/table/tbody/tr[3]/td[4]',
      {'veh_vehicle_type_str' => 'ciclomotore'} => 'Ciclomotore',
      {'veh_fuel_str' => 'benzina'} => 'Benzina'

    }

  end

  def build_hash_sect_4()

    @target_values = {}

    @target_values = {

      {'pol_client_type_str' => 'persona giuridica'} => '//input[@name="PFIS" and @value="0"]',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Il contraente presenta l\'attestato di rischio',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Veicolo immatricolato per 1^ volta al P.R.A.',
      {'pol_number_plate_type_str' => 'definitiva'} => 'Definitiva',
      {'pol_public_liability_exemption_str' => '0'} => '0 Euro',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3,000,000 € - 2,500,000 € - 500,000 €',
      {'pol_public_liability_indemnity_limit_str' => '5,200,000'} => '6,000,000 € - 5,000,000 € - 1,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6,000,000 € - 6,000,000 € - 6,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '10,000,000 € - 10,000,000 € - 10,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15,000,000 € - 15,000,000 € - 15,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '20,000,000'} => '20,000,000 € - 20,000,000 € - 20,000,000 €',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '25,000,000 € - 25,000,000 € - 25,000,000 €',
      {'pol_property_type_to_be_insured_str' => 'autocarro per trasporto persone o cose'} => 'Autocarro',
      {'pol_quotation_str' => 'fissa'} => 'Fissa',
      {'pol_quotation_str' => 'bm'} => 'Bonus/Malus',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//html/body/form/div[2]/div/div[5]/div/table/tbody/tr[3]/td[4]',
      {'veh_fuel_str' => 'diesel'} => 'Diesel',
      {'veh_hook_str' => 'no'} => 'No',
      {'veh_third_party_str' => 'conto proprio'} => 'Conto proprio (cose)',
      {'veh_third_party_str' => 'conto terzi'} => 'Conto terzi (cose)',
      {'veh_vehicle_type_str' => 'autocarro per trasporto persone o cose'} => 'Autocarro',

      {'veh_liquid_fuel_transportation_str' => 'no'} => 'B00006',
      {'veh_corrosive_oily_gas_liquid_transportation_str' => 'no'} => 'B00007',
      {'veh_radioactive_substances_transportation_str' => 'no'} => 'B00008',
      {'veh_toxic_gas_explosive_transportation_str' => 'no'} => 'B00001',
      {'veh_inflammable_liquid_transportation_str' => 'no'} => 'B00002',
      {'pol_renounce_compensation_str' => 'no'} => '_RCA03',
      {'veh_rent_str' => 'no'} => '_ESTNL',
      {'veh_rent_with_driver_str' => 'no'} => '_ESTNC',
      {'pol_driving_type_str' => 'no'} => '_RCA17',
      {'veh_use_for_shops_str' => 'no'} => '_ESTUN',

      }

  end

end