module Provider2Generali

def build_hash_sect_2()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_bersani_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_client_type_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_nr_of_paid_claims_this_yr_str' => 'translate_field',
      'pol_nr_of_paid_claims_1_yr_str' => 'translate_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'translate_field',
      'pol_nr_of_paid_claims_3_yr_str' => 'translate_field',
      'pol_nr_of_paid_claims_4_yr_str' => 'translate_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_vehicle_use_str' => 'translate_field',

      'pol_RCA_code_str' => 'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'pol_record_id_str'  => 'copy_field',
      'pol_residence_str' => 'copy_field',
      'veh_capacity_num' => 'copy_field',

      'pol_birth_date_day_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d")',
      'pol_birth_date_month_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%m")',
      'pol_birth_date_year_num' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%Y")',
      'pol_birth_date_str'  => 'european_date = \'%d%m%Y\'; (Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years)strftime(european_date).to_s' ,
      'pol_matriculation_date_day_str'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%d")',
      'pol_matriculation_date_month_str'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%m")',
      'pol_matriculation_date_str'  => 'european_date = \'%d%m%Y\'; (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years)strftime(european_date).to_s' ,
      'pol_matriculation_date_year_num'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%Y")',
      'veh_vehicle_type_str' => '(profilefield[:veh_passenger_transportation_str]== "si") ? "Motociclo due posti" : "Motociclo posto unico"',

    }

end

def build_hash_sect_3()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_bersani_str' => 'translate_field',
      'pol_client_type_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_vehicle_use_str' => 'translate_field',

      'pol_birth_date_str' => 'copy_field',
      'pol_RCA_code_str' => 'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'pol_residence_str' => 'copy_field',
      'veh_capacity_num' => 'copy_field',

      'pol_matriculation_date_day_str'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%d")',
      'pol_matriculation_date_month_str'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%m")',
      'pol_matriculation_date_str'  => 'european_date = \'%d%m%Y\'; (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years)strftime(european_date).to_s' ,
      'pol_matriculation_date_year_num'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%Y")',
      'veh_vehicle_type_str' => '(profilefield[:veh_passenger_transportation_str]== "si") ? "Ciclomotore 2 posti" : "Ciclomotore posto unico"',

    }

end

def build_hash_sect_4()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_bersani_str' => 'translate_field',
      'pol_client_type_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_quotation_str' => 'translate_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'veh_alarm_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_hook_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',

      'pol_birth_date_str' => 'copy_field',
      'pol_RCA_code_str' => 'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'pol_residence_str' => 'copy_field',
      'veh_full_load_total_weight_num' => 'copy_field',
      'veh_weight_to_be_towed_num' => 'copy_field',

      'pol_matriculation_date_day_str'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%d")',
      'pol_matriculation_date_month_str'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%m")',
      'pol_matriculation_date_str'  => 'european_date = \'%d%m%Y\'; (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years)strftime(european_date).to_s' ,
      'pol_matriculation_date_year_num'  => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%Y")',
      'veh_vehicle_use_str' => '(profilefield[:veh_third_party_str]== "Conto proprio") ? " Cose conto proprio" : " Cose conto terzi"',

    }

end

end
