module Provider2Zurich

  def build_hash_sect_1()

    @target_values = {}

    @target_values = {
      
      {'veh_fuel_str' => 'benzina'} => 'COD_TCMB_B',
      {'veh_fuel_str' => 'diesel'} => 'COD_TCMB_D',
      {'pol_risk_certificate_str' => 'si'} => 'CODPRO71_1',
      {'pol_BM_assigned_str' => '-1'} => '01',
      {'pol_BM_assigned_str' => '1'} => '02',
      {'pol_BM_assigned_str' => '2'} => '03',
      {'pol_BM_assigned_str' => '3'} => '04',
      {'pol_BM_assigned_str' => '4'} => '05',
      {'pol_BM_assigned_str' => '5'} => '06',
      {'pol_BM_assigned_str' => '6'} => '07',
      {'pol_BM_assigned_str' => '7'} => '08',
      {'pol_BM_assigned_str' => '8'} => '09',
      {'pol_BM_assigned_str' => '9'} => '10',
      {'pol_BM_assigned_str' => '10'} => '11',
      {'pol_BM_assigned_str' => '11'} => '12',
      {'pol_BM_assigned_str' => '12'} => '13',
      {'pol_BM_assigned_str' => '13'} => '14',
      {'pol_BM_assigned_str' => '14'} => '15',
      {'pol_BM_assigned_str' => '15'} => '16',
      {'pol_BM_assigned_str' => '16'} => '17',
      {'pol_BM_assigned_str' => '17'} => '18',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'driv_heir_str' => 'no'} => 'CLA_ERLE_N',
      {'veh_tow_hook_str' => 'no'} => 'CODVER23_N',
      {'pol_client_type_str' => 'persona fisica'} => '//*[@id="TIP_PERS_F"]',
      {'pol_client_type_str' => 'persona giuridica'} => '//*[@id="TIP_PERS_G"]',
      {'pol_defined_drive_str' => 'si'} => 'GUI_DEFINI_S',
      {'pol_defined_drive_str' => 'no'} => 'GUI_DEFINI_N',
      {'pol_exclusive_drive_str' => 'si'} => 'GUI_ESCLUS_S',
      {'pol_exclusive_drive_str' => 'no'} => 'GUI_ESCLUS_N',
      {'pol_free_drive_str' => 'si'} => 'GUI_LIBERA_S',
      {'pol_free_drive_str' => 'no'} => 'GUI_LIBERA_N',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000000'} => '6.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '10.000.000 EURO',
      {'own_owner_sex_str' => 'M'} => 'COD_SESS_M',
      {'own_owner_sex_str' => 'F'} => 'COD_SESS_F',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_type_of_contract_str' => 'nuova polizza'} => '//input[@id="COD_TMOV_N"]',
      {'pol_quotation_str' => 'bm'} => 'BONUS MALUS',
      {'pol_privacy_1_str' => 'id elemento web1'} => '//*[@id="check1"]',
      {'pol_property_type_to_be_insured_str' => 'autovettura'} => 'AUTOVETTURA SERVIZIO PRIVATO',
      {'veh_vehicle_type_str' => 'autovettura'} => 'AUTOVETTURA',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',

    }

  end
   
  def build_hash_sect_2()

    @target_values = {}

    @target_values = {

      {'driv_heir_str' => 'no',} => '//*[@id="CLA_ERLE_N"]',
      {'own_owner_sex_str' => 'M'} => '//*[@id="COD_SESS_M"]',
      {'own_owner_sex_str' => 'F'} => '//*[@id="COD_SESS_F"]',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '01',
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
      {'pol_client_type_str' => 'persona fisica'} => '//*[@id="TIP_PERS_F"]',
      {'pol_client_type_str' => 'persona giuridica'} => '//*[@id="TIP_PERS_G"]',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_privacy_1_str' => 'id elemento web1'} => '//*[@id="check1"]',
      {'pol_property_type_to_be_insured_str' => 'motociclo'} => 'MOTOCICLO USO PRIVATO',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '10.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '26.000.000 EURO',
      {'pol_quotation_str' => 'bm'} => 'BONUS MALUS',
      {'pol_quotation_str' => 'fissa'} => 'BONUS MALUS',
      {'pol_quotation_str' => 'franchigia'} => 'BONUS MALUS',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'pol_risk_certificate_str' => 'si'} => 'CODPRO71_1',
      {'pol_type_of_contract_str' => 'nuova polizza'} => '//input[@id="COD_TMOV_N"]',
      {'veh_fuel_str' => 'benzina'} => '//*[@id="COD_TCMB_B"]',

    }

  end

  def build_hash_sect_3()

    @target_values = {}

    @target_values = {

      {'driv_heir_str' => 'no',} => '//*[@id="CLA_ERLE_N"]',
      {'own_owner_sex_str' => 'M'} => '//*[@id="COD_SESS_M"]',
      {'own_owner_sex_str' => 'F'} => '//*[@id="COD_SESS_F"]',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '01',
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
      {'pol_client_type_str' => 'persona fisica'} => '//*[@id="TIP_PERS_F"]',
      {'pol_client_type_str' => 'persona giuridica'} => '//*[@id="TIP_PERS_G"]',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_privacy_1_str' => 'id elemento web1'} => '//*[@id="check1"]',
      {'pol_property_type_to_be_insured_str' => 'ciclomotore'} => 'CICLOMOTORE USO PRIVATO',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '10.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '26.000.000 EURO',
      {'pol_quotation_str' => 'bm'} => 'BONUS MALUS',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'pol_risk_certificate_str' => 'si'} => 'CODPRO71_1',
      {'pol_type_of_contract_str' => 'nuova polizza'} => '//input[@id="COD_TMOV_N"]',
      {'veh_fuel_str' => 'benzina'} => '//*[@id="COD_TCMB_B"]',

    }

  end

  def build_hash_sect_4()

    @target_values = {}

    @target_values = {

      {'driv_heir_str' => 'no'} => 'CLA_ERLE_N',
      {'own_owner_zip_code_str' => 'comune'} => '//*[@id="COD_CAP0_C"]',
      {'own_owner_zip_code_str' => 'provincia'} => '//*[@id="COD_CAP0_P"]',
      {'pol_BM_assigned_str' => '1 da almeno 1 anno'} => '01',
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
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Prima Immatricolazione',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Proveniente da altra Compagnia',
      {'pol_pejus_cu_str' => 'no'} => 'NO PEJUS',
      {'pol_privacy_1_str' => 'id elemento web1'} => '//*[@id="check1"]',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '3.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '10,000,000'} => '10.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '15,000,000'} => '15.000.000 EURO',
      {'pol_public_liability_indemnity_limit_str' => '26,000,000'} => '26.000.000 EURO',
      {'pol_RCA_premium_id_str' => 'id elemento'} => '//html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong',
      {'pol_type_of_contract_str' => 'nuova polizza'} => '//input[@id="COD_TMOV_N"]',
      {'veh_fuel_str' => 'diesel'} => 'D - GASOLIO',
      {'veh_loading_unloading_str' => 'no'} => 'NO',
      {'veh_marble_blocks_str' => 'no'} => 'NO',
      {'veh_transportation_of_dangerous_goods_A_str' => 'no'} => 'NO',
      {'veh_transportation_of_dangerous_goods_B_str' => 'no'} => 'NO',

    }

  end

end