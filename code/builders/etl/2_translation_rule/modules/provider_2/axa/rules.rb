module Provider2Axa

def build_hash_sect_2()

    @rule_values ={}

    @rule_values = {
      
      'driv_driving_experience_str' => 'translate_field',
      'own_owner_sex_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_property_type_to_be_insured_str' => 'translate_field',
      'pol_public_liability_exemption_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_second_driver_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',

      'own_owner_zip_code_str' => 'copy_field',
      'pol_claims_total_number_str' => 'copy_field',
      'pol_claims_total_number_malus_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',

      'pol_birth_date_str' => 'data= Date.parse(profilefield[:pol_birth_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s',
      'pol_matriculation_date_str' => 'data=Date.parse(profilefield[:pol_matriculation_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s',
      'pol_nr_of_paid_claims_2_yr_str' => 'x= profilefield[:pol_nr_of_paid_claims_this_yr_str].to_i; y= profilefield[:pol_nr_of_paid_claims_1_yr_str].to_i; sin= x+y',
      'veh_make_str' => 'make=profilefield[:veh_make_str];  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:^";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "\\\\b";',
      'veh_model_str' => 'kw=profilefield[:veh_kw_str];make=profilefield[:veh_model_str]; make= make.gsub(/tddi/i, "TD DI");  make= make.gsub(/tdci/i, "TD CI");  make= make.gsub(/turbodiesel/i, "TD"); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*(\\\\s)*(?=.*?\\\\b" + regexpi_mod_array[0].to_s + "+" ; index=0 ;for index in (1..regexpi_mod_array.length-1);regexp_mod = regexp_mod + "((?=.*?\\\\b" + regexpi_mod_array[index].to_s + "\\\\b))*" end; regexp_mod = regexp_mod + ").+";',


      'pol_premium_id_str' => '/html/body/div/div/div/form/table[2]/tbody/tr[5]/td[2]/strong'

    }

end

def build_hash_sect_3()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_property_type_to_be_insured_str' => 'translate_field',
      'pol_public_liability_exemption_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',

      'own_owner_birth_date_str' => 'copy_field',
      'own_owner_zip_code_str' => 'copy_field',
      'pol_claims_total_number_str' => 'copy_field',
      'pol_claims_total_number_malus_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',

      'pol_matriculation_date_str' => 'data=Date.parse(profilefield[:pol_matriculation_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s',
      'pol_nr_of_paid_claims_2_yr_str' => 'x= profilefield[:pol_nr_of_paid_claims_this_yr_str].to_i; y= profilefield[:pol_nr_of_paid_claims_1_yr_str].to_i; sin= x+y',
      'veh_make_str' => 'make=profilefield[:veh_make_str];  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:^";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "\\\\b";',
      'veh_model_str' => 'kw=profilefield[:veh_kw_str];make=profilefield[:veh_model_str]; make= make.gsub(/tddi/i, "TD DI");  make= make.gsub(/tdci/i, "TD CI");  make= make.gsub(/turbodiesel/i, "TD"); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*(\\\\s)*(?=.*?\\\\b" + regexpi_mod_array[0].to_s + "+" ; index=0 ;for index in (1..regexpi_mod_array.length-1);regexp_mod = regexp_mod + "((?=.*?\\\\b" + regexpi_mod_array[index].to_s + "\\\\b))*" end; regexp_mod = regexp_mod + ").+";',

      'pol_premium_id_str' => '/html/body/form/div[2]/div/div[5]/div/table/tbody/tr[3]/td[4]'

    }

end

def build_hash_sect_4()

    @rule_values ={}

    @rule_values = {

      'pol_client_type_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_number_plate_type_str' => 'translate_field',
      'pol_pejus_cu_str' => 'translate_field',
      'pol_property_type_to_be_insured_str' => 'translate_field',
      'pol_quotation_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_hook_str' => 'translate_field',
      'veh_product_sector_str' => 'translate_field',
      'veh_third_party_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',

      'own_owner_zip_code_str' => 'copy_field',
      'pol_claims_total_number_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'veh_full_load_total_weight_num' => 'copy_field',

      'pol_matriculation_date_str' => 'data=Date.parse(profilefield[:pol_matriculation_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s',
      'pol_nr_of_paid_claims_2_yr_str' => 'x= profilefield[:pol_nr_of_paid_claims_this_yr_str].to_i; y= profilefield[:pol_nr_of_paid_claims_1_yr_str].to_i; sin= x+y',
      'pol_nr_of_paid_claims_3_yr_str' => 'x= profilefield[:pol_nr_of_paid_claims_this_yr_str].to_i; y= profilefield[:pol_nr_of_paid_claims_1_yr_str].to_i; z= profilefield[:pol_nr_of_paid_claims_2_yr_str].to_i; sin= x+y+z',
      'veh_make_str' => 'make=profilefield[:veh_make_str];  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:^"; regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end; regexp_mod = regexp_mod + "\\\\b";',
      'veh_set_up_str' => 'make=profilefield[:veh_set_up_str]; make= make.gsub(/(\\s)+ie(\\s)+/i, " i.e. "); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*(\\\\s)*(?=.*?\\\\b" + regexpi_mod_array[0].to_s + "+" ; index=0 ;for index in (1..regexpi_mod_array.length-1) ;regexp_mod = regexp_mod + "((?=.*?\\\\b" + regexpi_mod_array[index].to_s + "\\\\b))*" end; regexp_mod = regexp_mod + ").+";',

    }

end

end
