module FieldMappingProvider2Sect4

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {

      'own_owner_specification_str'  => 'if infield[:own_owner_sex_str].strip.upcase == "M"; infield[:own_owner_sex_str].strip.upcase; elsif infield[:own_owner_sex_str].strip.upcase == "F"; infield[:own_owner_sex_str].strip.upcase; else "C"; end' ,
      'own_owner_zip_code_str' =>'cap = infield[:own_owner_zip_code_str].strip.downcase; cap = cap.gsub("15100","15121"); cap = cap.gsub("47023","47521");cap = cap.gsub("44100","44121");cap = cap.gsub("41100","41121");cap = cap.gsub("43100","43121");cap = cap.gsub("61100","61121");cap = cap.gsub("29100","29121");cap = cap.gsub("48100","48121");cap = cap.gsub("42100","42121");cap = cap.gsub("47900","47921");cap = cap.gsub("38100","38121");cap = cap.gsub("71100","71121");cap = cap.gsub("47100","47121");cap = cap.gsub("74100","74121");',
      'pol_record_id_str' =>'infield[:pol_record_id_str].strip.downcase',
      'pol_BM_assigned_str' =>'infield[:pol_BM_assigned_str].strip.downcase',
      'pol_claims_total_number_str' =>'infield[:pol_claims_total_number_str].strip.downcase',
      'pol_coming_from_BM_str' =>  'bm=infield[:pol_BM_assigned_srt]; claimsyear=infield[:pol_nr_of_paid_claims_this_yr_str]; bm.to_i == -1 ? bm ="-1" : if claimsyear.to_i > 0 && bm.to_i > 3 ;  bm= bm.to_i - 2;  else  bm = bm.to_i + 1 end',
      'pol_insurance_situation_str' => 'sitass=infield[:pol_insurance_situation_str].strip.downcase;  if sitass=~/1a*\\s*[(A-Za-z0-9)*(\\s)*]*/ ; x= "1a immatricolazione"; else x="proveniente da altra compagnia" end;',
      'pol_matriculation_date_str' => 'infield[:pol_matriculation_date_str].strip.downcase',
      'pol_nr_of_paid_claims_1_yr_str' =>'infield[:pol_nr_of_paid_claims_1_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_2_yr_str' =>'infield[:pol_nr_of_paid_claims_2_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_3_yr_str' =>'infield[:pol_nr_of_paid_claims_3_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_4_yr_str' =>'infield[:pol_nr_of_paid_claims_4_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_5_yr_str' =>'infield[:pol_nr_of_paid_claims_5_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_this_yr_str' =>'infield[:pol_nr_of_paid_claims_this_yr_str].strip.downcase',
      'pol_nr_of_yrs_without_claims_str'  => 'infield[:pol_claims_total_number_str].to_i == 1 ? X=4 : x=5;' ,
      'pol_policy_starting_date_day_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_month_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_str'  => '"si calcola runtime"' ,
      'pol_policy_starting_date_year_num'  => '"si calcola runtime"' ,      'pol_public_liability_exemption_str' =>'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' =>'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',
      'pol_quotation_str' =>'infield[:pol_quotation_str].strip.downcase',
      'pol_residence_province_str' =>'infield[:pol_residence_province_str].strip.upcase',
      'pol_residence_str' =>'infield[:pol_residence_str].strip.upcase',
      'veh_full_load_total_weight_str' =>'infield[:veh_full_load_total_weight_str].strip.downcase',
      'veh_third_party_str' =>'infield[:veh_third_party_str].strip.downcase',

      'driv_birth_place_str' => 'infield[:pol_residence_str].strip.upcase',
      'driv_heir_str' => "'no'",
      'own_owner_sex_str' => "'C'",
      'pol_client_type_str' => "'persona giuridica'",
      'pol_instalment_str' => "'annuale'",
      'pol_number_of_NI_NA_yrs_during_5_yrs_str' => "'0'",
      'pol_number_plate_type_str' => "'definitiva'",
      'pol_pejus_cu_str' => "'0%'",
      'pol_privacy_1_str' => "'id elemento web1'",
      'pol_privacy_2_str' => "'id elemento web2'",
      'pol_privacy_3_str' => "'id elemento web3'",
      'pol_property_type_to_be_insured_str' => "'autocarro per trasporto persone o cose'",
      'pol_RCA_code_str' => "'RC'",
      'pol_RCA_on_off_str' => "'on'",
      'pol_RCA_premium_id_str' => "'id elemento'",
      'pol_renounce_compensation_str' => "'no'",
      'pol_risk_certificate_str' => '"si"',
      'pol_type_of_contract_str' => "'nuova polizza'",
      'veh_alarm_str' => "'nessuno'",
      'veh_corrosive_oily_gas_liquid_transportation_str' => "'no'",
      'veh_fuel_str' => "'diesel'",
      'veh_hook_str' => "'no'",
      'veh_inflammable_liquid_transportation_str' => "'no'",
      'veh_liquid_fuel_transportation_str' => "'no'",
      'veh_loading_unloading_str' => "'no'",
      'veh_marble_blocks_str' => "'no'",
      'veh_product_sector_str' => "'Pesca, piscicoltura e servizi connessi'",
      'veh_radioactive_substances_transportation_str' => "'no'",
      'veh_rent_str' => "'no'",
      'veh_rent_with_driver_str' => "'no'",
      'veh_toxic_gas_explosive_transportation_str' => "'no'",
      'veh_transportation_of_dangerous_goods_A_str' => "'no'",
      'veh_transportation_of_dangerous_goods_B_str' => "'no'",
      'veh_truck_tractor_weight_num' => "'coincide col peso totale'",
      'veh_use_for_shops_str' => "'no'",
      'veh_vehicle_type_str' => "'autocarro per trasporto persone o cose'",
      'veh_vehicle_use_str' => "'privato'",
      'veh_weight_to_be_towed_num' => "'veh_full_load_total_weight_str'",

    }
  end

end