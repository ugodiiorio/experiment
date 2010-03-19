module FieldMappingProvider2Sect3

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {

      'driv_driver_sex_str' => 'if (infield[:own_owner_sex_str].strip.upcase == "C") infield[:driv_driver_sex_str].strip.downcase else infield[:own_owner_sex_str].strip.upcase',
      'driv_residence_str' => 'infield[:driv_residence_str].strip.downcase',
      'own_owner_sex_str' => 'infield[:own_owner_sex_str].strip.upcase',
      'own_owner_specification_str'  => 'if infield[:own_owner_sex_str].strip.upcase == "M"; infield[:own_owner_sex_str].strip.upcase; elsif infield[:own_owner_sex_str].strip.upcase == "F"; infield[:own_owner_sex_str].strip.upcase; else "C"; end' ,
      'own_owner_zip_code_str' => 'infield[:own_owner_zip_code_str].strip.downcase',
      'pol_birth_date_str' => '(DateTime::now - infield[:pol_birth_date_str].to_i.years).strftime("%F")',
      'pol_birth_date_day_str' => '(DateTime::now - infield[:pol_birth_date_str].to_i.years).strftime("%d")',
      'pol_birth_date_month_str' => '(DateTime::now - infield[:pol_birth_date_str].to_i.years).strftime("%m")',
      'pol_birth_date_year_num' => '(DateTime::now - infield[:pol_birth_date_str].to_i.years).strftime("%Y")',
      'pol_BM_assigned_str' => 'infield[:pol_BM_assigned_str].strip.downcase',
      'pol_claims_total_number_str' => 'infield[:pol_claims_total_number_str].strip.downcase',
      'pol_client_type_str' => 'infield[:pol_client_type_str].strip.downcase',
      'pol_coming_from_BM_str' =>  'bm=infield[:pol_BM_assigned_srt]; claimsyear=infield[:pol_nr_of_paid_claims_this_yr_str]; bm.to_i == -1 ? bm ="-1" : if claimsyear.to_i > 0 && bm.to_i > 3 ;  bm= bm.to_i - 2;  else  bm = bm.to_i + 1 end',
      'pol_driver_zip_code_str' => 'infield[:pol_driver_zip_code_str].strip.downcase',
      'pol_insurance_situation_str' => 'sitass=infield[:pol_insurance_situation_str].strip.downcase;  if sitass=~/1a*\\s*[(A-Za-z0-9)*(\\s)*]*/ ; x= "1a immatricolazione"; else x="proveniente da altra compagnia" end;',
      'pol_nr_of_paid_claims_1_yr_str' => 'infield[:pol_nr_of_paid_claims_1_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_2_yr_str' => 'infield[:pol_nr_of_paid_claims_2_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_3_yr_str' => 'infield[:pol_nr_of_paid_claims_3_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_4_yr_str' => 'infield[:pol_nr_of_paid_claims_4_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_5_yr_str' => 'infield[:pol_nr_of_paid_claims_5_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_this_yr_str' => 'infield[:pol_nr_of_paid_claims_this_yr_str].strip.downcase',
      'pol_policy_starting_date_day_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_month_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_year_num'  => '"si calcola runtime"' ,'veh_passenger_transportation_str' => 'infield[:veh_passenger_transportation_str].strip.downcase',
      'pol_public_liability_exemption_str' => 'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' => 'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',
      'pol_quotation_str' => 'infield[:pol_quotation_str].strip.downcase',
      'pol_record_id_str' => 'infield[:pol_record_id_str].strip.downcase',
      'pol_residence_province_str' => 'infield[:pol_residence_province_str].strip.upcase',
      'pol_residence_str' => 'infield[:pol_residence_str].strip.upcase',

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