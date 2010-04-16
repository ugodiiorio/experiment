module FieldMappingProvider2Sect3

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {

      'driv_driver_sex_str' => 'infield[:driv_driver_sex_str].strip.upcase',
      'driv_residence_str' => 'infield[:driv_residence_str].strip.downcase',
      'own_owner_sex_str' => 'infield[:own_owner_sex_str].strip.upcase == "" ? "C" : infield[:own_owner_sex_str].strip.upcase',
      'own_owner_specification_str' => 'if infield[:own_owner_sex_str].strip.upcase == "M"; infield[:own_owner_sex_str].strip.upcase; elsif infield[:own_owner_sex_str].strip.upcase == "F"; infield[:own_owner_sex_str].strip.upcase; else "C"; end',
      'own_owner_zip_code_str' => 'cap = infield[:own_owner_zip_code_str].strip.downcase; cap = cap.gsub("15100","15121"); cap = cap.gsub("47023","47521");cap = cap.gsub("44100","44121");cap = cap.gsub("41100","41121");cap = cap.gsub("43100","43121");cap = cap.gsub("61100","61121");cap = cap.gsub("29100","29121");cap = cap.gsub("48100","48121");cap = cap.gsub("42100","42121");cap = cap.gsub("47900","47921");cap = cap.gsub("38100","38121");cap = cap.gsub("71100","71121");cap = cap.gsub("47100","47121");cap = cap.gsub("74100","74121");',
      'pol_bersani_str' => 'infield[:pol_bersani_str].strip.downcase',
      'pol_birth_date_day_str' => 'infield[:pol_birth_date_str]',
      'pol_birth_date_month_str' => 'infield[:pol_birth_date_str]',
      'pol_birth_date_str' => 'infield[:pol_birth_date_str]',
      'pol_birth_date_year_num' => 'infield[:pol_birth_date_str]',
      'pol_BM_assigned_str' => 'infield[:pol_BM_assigned_str]==""  ? "14" : infield[:pol_BM_assigned_str].strip.downcase',
      'pol_BM_particular_cases_str' => '"no"',
      'pol_claims_total_number_str' => 'infield[:pol_claims_total_number_str].strip.downcase',
      'pol_client_type_str' => 'infield[:pol_client_type_str].strip.downcase',
      'pol_coming_from_BM_str' =>  'bm=infield[:pol_BM_assigned_srt]; claimsyear=infield[:pol_nr_of_paid_claims_this_yr_str]; bm.to_i == -1 ? bm ="-1" : if claimsyear.to_i > 0 && bm.to_i > 3 ;  bm= bm.to_i - 2;  else  bm = bm.to_i + 1 end',
      'pol_driver_zip_code_str' => 'cap = infield[:pol_driver_zip_code_str].strip.downcase; cap = cap.gsub("15100","15121"); cap = cap.gsub("47023","47521");cap = cap.gsub("44100","44121");cap = cap.gsub("41100","41121");cap = cap.gsub("43100","43121");cap = cap.gsub("61100","61121");cap = cap.gsub("29100","29121");cap = cap.gsub("48100","48121");cap = cap.gsub("42100","42121");cap = cap.gsub("47900","47921");cap = cap.gsub("38100","38121");cap = cap.gsub("71100","71121");cap = cap.gsub("47100","47121");cap = cap.gsub("74100","74121");',
      'pol_insurance_situation_str' => 'sitass=infield[:pol_insurance_situation_str].strip.downcase;  if sitass=~/1a*\\s*[(A-Za-z0-9)*(\\s)*]*/ ; x= "1a immatricolazione"; else x="proveniente da altra compagnia" end;',
      'pol_matriculation_date_day_str' => 'infield[:pol_matriculation_date_str].strip',
      'pol_matriculation_date_month_str' => 'infield[:pol_matriculation_date_str].strip',
      'pol_matriculation_date_str' => 'infield[:pol_matriculation_date_str].strip',
      'pol_matriculation_date_year_num' => 'infield[:pol_matriculation_date_str].strip',
      'pol_nr_of_paid_claims_1_yr_str' => 'infield[:pol_nr_of_paid_claims_1_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_2_yr_str' => 'infield[:pol_nr_of_paid_claims_2_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_3_yr_str' => 'infield[:pol_nr_of_paid_claims_3_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_4_yr_str' => 'infield[:pol_nr_of_paid_claims_4_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_5_yr_str' => 'infield[:pol_nr_of_paid_claims_5_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_this_yr_str' => 'infield[:pol_nr_of_paid_claims_this_yr_str].strip.downcase',
      'pol_nr_of_yrs_without_claims_str' => 'infield[:pol_claims_total_number_str].to_i == 1 ? x=4 : x=5;',
      'pol_policy_starting_date_day_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_month_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_year_num'  => '"si calcola runtime"' ,
      'veh_passenger_transportation_str' => 'infield[:veh_passenger_transportation_str].strip.downcase',
      'pol_public_liability_exemption_str' => 'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' => 'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',
      'pol_public_liability_young_exemption_str ' => '"no"',
      'pol_quotation_str' => 'infield[:pol_quotation_str].strip.downcase',
      'pol_record_id_str' => 'infield[:pol_record_id_str].strip.downcase',
      'pol_residence_province_str' => 'infield[:pol_residence_province_str].strip.upcase',
      'pol_residence_str' => 'infield[:pol_residence_str].strip.upcase',
      'veh_make_str' => 'infield[:veh_make_str].strip',
      'veh_model_str' => 'infield[:veh_model_str].strip',

      'driv_birth_place_str' => 'infield[:pol_residence_str].strip.upcase',
      'driv_heir_str' => "'no'",
      'pol_instalment_str' => '"annuale"',
      'pol_privacy_1_str' => "'id elemento web1'",
      'pol_privacy_2_str' => "'id elemento web2'",
      'pol_privacy_3_str' => "'id elemento web3'",
      'pol_property_type_to_be_insured_str' => "'ciclomotore'",
      'pol_RCA_code_str' => "'RC'",
      'pol_RCA_on_off_str' => "'on'",
      'pol_RCA_premium_id_str' => "'id elemento'",
      'pol_risk_certificate_str' => '"si"',
      'pol_type_of_contract_str' => "'nuova polizza'",
      'pol_yrs_with_no_claims_in_RC_str' => "'4'",
      'veh_capacity_num' => "'50'",
      'veh_fuel_str' =>  "'benzina'",
      'veh_gas_methane_supply_str' => "'no'",
      'veh_rent_str' => "'no'",
      'veh_vehicle_type_str' => "'ciclomotore'",
      'veh_vehicle_use_str' => "'privato'",
      
    }
    
  end

end