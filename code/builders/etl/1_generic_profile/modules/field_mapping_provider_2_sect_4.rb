module FieldMappingProvider2Sect4

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {

      'driv_birth_place_str' => 'infield[:pol_residence_str].strip.upcase',
      'driv_driver_sex_str' => "'M'",
      'driv_heir_str' => "'no'",
      'own_owner_sex_str' => "'C'",
      'own_owner_specification_str' => '"C"',
      'own_owner_zip_code_str' => 'infield[:own_owner_zip_code_str].strip.downcase',
      'pol_bersani_str' => '"no"',
      'pol_BM_assigned_str' => 'infield[:pol_BM_assigned_str]==""  ? "14" : infield[:pol_BM_assigned_str].strip.downcase',
      'pol_BM_in_risk_certificate_str' =>  '"si"',
      'pol_BM_particular_cases_str' => '"no"',
      'pol_claims_total_number_str' => 'infield[:pol_claims_total_number_str].strip.downcase',
      'pol_client_type_str' => "'persona giuridica'",
      'pol_coming_from_BM_str' => 'bm=infield[:pol_BM_assigned_str]; claimsyear=infield[:pol_nr_of_paid_claims_this_yr_str]; bm.to_i == 0 ? cbm ="0" : if claimsyear.to_i > 0 && bm.to_i > 3 ;  cbm= bm.to_i - 2;  else  cbm = bm.to_i + 1 end',
      'pol_driving_type_str' => "'no'",
      'pol_instalment_str' => "'annuale'",
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
      'pol_number_of_NI_NA_yrs_during_5_yrs_str' => "'0'",
      'pol_number_plate_type_str' => "'definitiva'",
      'pol_pejus_cu_str' => "'0%'",
      'pol_policy_starting_date_day_str' => '"si calcola runtime"',
      'pol_policy_starting_date_month_str' => '"si calcola runtime"',
      'pol_policy_starting_date_str' => '"si calcola runtime"',
      'pol_policy_starting_date_year_num' => '"si calcola runtime"',
      'pol_privacy_1_str' => "'id elemento web1'",
      'pol_privacy_2_str' => "'id elemento web2'",
      'pol_privacy_3_str' => "'id elemento web3'",
      'pol_property_type_to_be_insured_str' => "'autocarro per trasporto persone o cose'",
      'pol_public_liability_exemption_str' => 'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' => 'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',
      'pol_quotation_str' => 'infield[:pol_quotation_str].strip.downcase',
      'pol_RCA_code_str' => "'RC'",
      'pol_RCA_on_off_str' => "'on'",
      'pol_RCA_premium_id_str' => "'id elemento'",
      'pol_record_id_str' => 'infield[:pol_record_id_str].strip.downcase',
      'pol_renounce_compensation_str' => "'no'",
      'pol_residence_province_str' => 'infield[:pol_residence_province_str].strip.upcase',
      'pol_residence_str' => 'infield[:pol_residence_str].strip.upcase',
      'pol_risk_certificate_str' => '"si"',
      'pol_type_of_contract_str' => "'nuova polizza'",
      'veh_alarm_str' => "'nessuno'",
      'veh_corrosive_oily_gas_liquid_transportation_str' => "'no'",
      'veh_fuel_str' => "'diesel'",
      'veh_full_load_total_weight_num' => 'infield[:veh_full_load_total_weight_num].strip.downcase',
      'veh_hook_str' => "'no'",
      'veh_inflammable_liquid_transportation_str' => "'no'",
      'veh_liquid_fuel_transportation_str' => "'no'",
      'veh_loading_unloading_str' => "'no'",
      'veh_marble_blocks_str' => "'no'",
      'veh_product_sector_str' => "'Pesca, piscicoltura e servizi connessi'",
      'veh_radioactive_substances_transportation_str' => "'no'",
      'veh_rent_str' => "'no'",
      'veh_rent_with_driver_str' => "'no'",
      'veh_third_party_str' => 'infield[:veh_third_party_str].strip.downcase',
      'veh_toxic_gas_explosive_transportation_str' => "'no'",
      'veh_transportation_of_dangerous_goods_A_str' => "'no'",
      'veh_transportation_of_dangerous_goods_B_str' => "'no'",
      'veh_truck_tractor_weight_num' => "'coincide col peso totale'",
      'veh_use_for_shops_str' => "'no'",
      'veh_vehicle_type_str' => "'autocarro per trasporto persone o cose'",
      'veh_vehicle_use_str' => "'privato'",
      'veh_weight_to_be_towed_num' => "'veh_full_load_total_weight_str'",

      #TODO
      'veh_make_str' => "'IVECO'",
      'veh_model_str' => "'Altro Allestimento'",

    }
    
  end

end