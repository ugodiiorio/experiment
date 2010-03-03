module Provider2Axa

def build_hash_sect_3()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_property_type_to_be_insured_str' => 'translate_field',
      'pol_public_liability_young_exemption_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',

      'own_owner_zip_code_str' => 'copy_field',
      'pol_claims_total_number_str' => 'copy_field',
      'pol_claims_total_number_malus_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',

      'own_owner_birth_date_str' => 'Date.parse(infield[:pol_birth_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s',
      'pol_matriculation_date_str' => 'Date.parse(infield[:pol_birth_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s',
      'pol_policy_starting_date_str' => 'Date.parse(infield[:pol_birth_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s',
      'veh_make_str' => 'regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "\\\\b";',
      'veh_set_up_str' => 'kw=infield[:veh_kw_str];make=infield[:veh_set_up_str]; make= make.gsub(/tddi/i, "TD DI");  make= make.gsub(/tdci/i, "TD CI");  make= make.gsub(/turbodiesel/i, "TD"); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*(\\\\s)*(?=.*?\\\\b" + regexpi_mod_array[0].to_s + "+" ; index=0 ;for index in (1..regexpi_mod_array.length-1);regexp_mod = regexp_mod + "((?=.*?\\\\b" + regexpi_mod_array[index].to_s + "\\\\b))*" end; regexp_mod = regexp_mod + ").+";',

      'pol_premium_id_str' => '/html/body/form/div[2]/div/div[5]/div/table/tbody/tr[3]/td[4]'

    }

end

end
