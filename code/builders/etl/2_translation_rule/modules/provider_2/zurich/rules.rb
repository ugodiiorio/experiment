module Provider2Zurich

def build_hash_sect_2()

    @rule_values ={}

    @rule_values = {

      'driv_heir_str' => 'translate_field',
      'own_owner_sex_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_client_type_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_privacy_1_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_quotation_str' => 'translate_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'pol_type_of_contract_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',

      'pol_birth_date_day_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d")',
      'pol_birth_date_month_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%m")',
      'pol_birth_date_year_num' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%Y")',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'copy_field',
      'pol_RCA_code_str' => 'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'veh_capacity_num' => 'copy_field',

      'pol_risk_certificate_str' => '(profilefield[:pol_insurance_situation_str]== "1a immatricolazione dopo l’acquisto del veicolo") ? "//*[@id=\"CODPRO71_9\"]" : "//*[@id=\"CODPRO71_1\"]"',

    }

end

def build_hash_sect_3()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_client_type_str' => 'translate_field',
      'driv_heir_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_privacy_1_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'pol_type_of_contract_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',

      'own_owner_birth_date_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'copy_field',
      'pol_RCA_code_str' => 'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',

      'pol_quotation_str' => 'BONUS MALUS',
      
    }

end

def build_hash_sect_4()

    @rule_values ={}

    @rule_values = {

      'driv_heir_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_quotation_str' => 'translate_field',
      'pol_pejus_cu_str' => 'translate_field',
      'pol_privacy_1_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_residence_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'pol_type_of_contract_str' => 'translate_field',
      'veh_loading_unloading_str' => 'translate_field',
      'veh_marble_blocks_str' => 'translate_field',
      'veh_transportation_of_dangerous_goods_A_str' => 'translate_field',
      'veh_transportation_of_dangerous_goods_B_str' => 'translate_field',

      'pol_claims_total_number_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'pol_RCA_code_str' => 'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'veh_full_load_total_weight_num' => 'copy_field',

      'pol_risk_certificate_str' => '(profilefield[:pol_insurance_situation_str]== "1a immatricolazione dopo l’acquisto del veicolo") ? "//*[@id=\"CODPRO71_9\"]" : "//*[@id=\"CODPRO71_1\"]"',
      'veh_vehicle_type_str' => '(profilefield[:veh_third_party_str]== "Conto proprio") ? " AUTOCARRO TRASP.COSE CONTO PROPRIO" : " AUTOCARRO TRASP.COSE CONTO TERZI"',

    }

end

end
