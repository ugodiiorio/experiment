module Provider2Zurich

def build_hash_sect_3()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_client_type_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_quotation_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'pol_type_of_contract_str' => '//*[@id="COD_TMOV_N"]',
      'veh_fuel_str' => 'translate_field',

      'pol_birth_date_day_str' => 'copy_field',
      'pol_birth_date_month_str' => 'copy_field',
      'pol_birth_date_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'copy_field',

      'pol_privacy_1_str' => '//*[@id="check1"]',
      'driv_heir_str' => '//*[@id="CLA_ERLE_N"]',

      'pol_premium_id_str' => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong'
      
    }

end

end
