module FieldMappingProvider2Sect1

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {

      'driv_birth_place_str' => 'infield[:pol_residence_str].strip.upcase',
      'driv_birth_province_str' => 'infield[:pol_residence_province_str].strip.upcase',
      'driv_birth_state_str' => '"ITALIA"',
      'driv_citizenship_str' => '"ITALIA"',
      'driv_civil_status_str' => '"Coniugato con figli"',
      'driv_driver_sex_str' => 'infield[:driv_driver_sex_str].strip.upcase',
      'driv_driving_experience_str' => nil,
      'driv_driving_license_month_of_issue_str' => 'infield[:driv_driving_license_yrs_str]',
      'driv_driving_license_points_str' => '"20"',
      'driv_driving_license_type_str' => '"B"',
      'driv_driving_license_year_of_issue_str' => 'infield[:driv_driving_license_yrs_str]',
      'driv_driving_license_yrs_str' => 'infield[:driv_driving_license_yrs_str].strip',
      'driv_heir_str' => '"no"',
      'driv_italian_residence_starting_yrs_num' => nil,
      'driv_job_2_str' => '"campo tecnico per genertel"',
      'driv_job_str' => 'infield[:driv_job_str].strip.downcase',
      'driv_residence_same_as_home_address_str' => '"si"',
      'driv_studies_str' => '"diploma"',
      'own_owner_residence_province_str' => 'infield[:own_owner_residence_province_str].strip.upcase',
      'own_owner_residence_str' => 'infield[:own_owner_residence_str].strip.upcase',
      'own_owner_sex_str' => 'infield[:own_owner_sex_str].strip.upcase == "" ? "C" : infield[:own_owner_sex_str].strip.upcase',
      'own_owner_specification_str' => 'if infield[:own_owner_sex_str].strip.upcase == "M"; infield[:own_owner_sex_str].strip.upcase; elsif infield[:own_owner_sex_str].strip.upcase == "F"; infield[:own_owner_sex_str].strip.upcase; else "C"; end',
      'own_owner_zip_code_str' => 'cap = infield[:own_owner_zip_code_str].strip.downcase ; cap = cap.gsub("15100","15121"); cap = cap.gsub("47023","47521");cap = cap.gsub("44100","44121");cap = cap.gsub("41100","41121");cap = cap.gsub("43100","43121");cap = cap.gsub("61100","61121");cap = cap.gsub("29100","29121");cap = cap.gsub("48100","48121");cap = cap.gsub("42100","42121");cap = cap.gsub("47900","47921");cap = cap.gsub("38100","38121");cap = cap.gsub("71100","71121");cap = cap.gsub("47100","47121");cap = cap.gsub("74100","74121");',
      'pol_already_benefit_from_bersani_str' => '"no"',
      'pol_bersani_policy_expiring_date_str' => '"3 months from now"',
      'pol_bersani_ref_vehicle_insured_with_company_str' => '"no"',
      'pol_bersani_ref_vehicle_number_plate_str' => '"ab123cd"',
      'pol_bersani_str' => 'infield[:pol_bersani_str].strip.downcase',
      'pol_birth_date_day_str' => 'infield[:pol_birth_date_str]',
      'pol_birth_date_month_str' => 'infield[:pol_birth_date_str]',
      'pol_birth_date_str' => 'infield[:pol_birth_date_str]',
      'pol_birth_date_year_num' => 'infield[:pol_birth_date_str]',
      'pol_BM_1_more_than_1_year_str' => 'infield[:pol_BM_assigned_str].strip.to_i == 0 ? "si" : "no"',
      'pol_BM_assigned_str' => 'infield[:pol_BM_assigned_str]==""  ? "14" : infield[:pol_BM_assigned_str].strip.downcase',
      'pol_BM_in_risk_certificate_str' => '"si"',
      'pol_BM_particular_cases_str' => '"no"',
      'pol_car_already_insured_with_company_str' => '"no"',
      'pol_claims_total_number_malus_str' => 'infield[:pol_claims_total_number_str].strip',
      'pol_claims_total_number_str' => 'infield[:pol_claims_total_number_str].strip',
      'pol_client_type_str' => 'infield[:pol_client_type_str].strip.downcase',
      'pol_cohabiting_children_str' => '"no"',
      'pol_coming_from_BM_str' => 'bm=infield[:pol_BM_assigned_str]; claimsyear=infield[:pol_nr_of_paid_claims_this_yr_str]; bm.to_i == 0 ? cbm ="0" : if claimsyear.to_i > 0 && bm.to_i > 3 ;  cbm= bm.to_i - 2;  else  cbm = bm.to_i + 1 end',
      'pol_coming_from_company_str' => '"generali"',
      'pol_current_policy_guarantee_str' => '"nessuna"',
      'pol_defined_drive_str' => 'infield[:pol_driving_type_str].strip.downcase == "esperta" ? "si" : "no"',
      'pol_driver_accident_indemnity_limit_str' => nil,
      'pol_driver_is_owner_str' => 'if infield[:own_owner_sex_str].strip.upcase == "M"; "si"; elsif infield[:own_owner_sex_str].strip.upcase == "F"; "si"; else "no"; end',
      'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'infield[:pol_driver_less_than_26_yrs_str].strip.downcase',
      'pol_driver_less_than_26_yrs_str' => 'infield[:pol_driver_less_than_26_yrs_str].strip.downcase',
      'pol_driver_zip_code_str' => 'cap = infield[:pol_driver_zip_code_str].strip; cap = cap.gsub("15100","15121"); cap = cap.gsub("47023","47521");cap = cap.gsub("44100","44121");cap = cap.gsub("41100","41121");cap = cap.gsub("43100","43121");cap = cap.gsub("61100","61121");cap = cap.gsub("29100","29121");cap = cap.gsub("48100","48121");cap = cap.gsub("42100","42121");cap = cap.gsub("47900","47921");cap = cap.gsub("38100","38121");cap = cap.gsub("71100","71121");cap = cap.gsub("47100","47121");cap = cap.gsub("74100","74121");',
      'pol_driving_license_suspension_str' => '"no"',
      'pol_driving_license_withdrawal_indemnity_limit_str' => nil,
      'pol_driving_type_str' => 'infield[:pol_driving_type_str].strip.downcase',
      'pol_drunkenness_fine_str' => '"no"',
      'pol_exclusive_drive_str' => '"no"',
      'pol_family_car_num' => '1',
      'pol_family_members_insured_with_company_str' => '0',
      'pol_first_claim_month_str' => '"Gennaio"',
      'pol_first_claim_year_str' => 'if claimslastyr = infield[:pol_nr_of_paid_claims_this_yr_str].to_i == 1 ; x= 0 ; elsif claimslastyr = infield[:pol_nr_of_paid_claims_1_yr_str].to_i == 1 ; x= 1;  elsif claimslastyr = infield[:pol_nr_of_paid_claims_2_yr_str].to_i == 1 ; x= 2;  elsif claimslastyr = infield[:pol_nr_of_paid_claims_3_yr_str].to_i == 1 ; x= 3; else  x= 0 ; end ;',
      'pol_free_drive_str' => 'infield[:pol_driving_type_str].strip.downcase == "libera" ? "si" : "no"',
      'pol_how_do_you_know_the_company_str' => '"passaparola"',
      'pol_instalment_str' => '"annuale"',
      'pol_insurance_situation_str' => 'sitass=infield[:pol_insurance_situation_str].strip.downcase;  if sitass=~/1a*\\s*[(A-Za-z0-9)*(\\s)*]*/ ; x= "1a immatricolazione"; else x="proveniente da altra compagnia" end;',
      'pol_leasing_str' => '"no"',
      'pol_matriculation_date_day_str' => 'infield[:pol_matriculation_date_str].strip',
      'pol_matriculation_date_month_str' => 'infield[:pol_matriculation_date_str].strip',
      'pol_matriculation_date_str' => 'infield[:pol_matriculation_date_str].strip',
      'pol_matriculation_date_year_num' => 'infield[:pol_matriculation_date_str].strip',
      'pol_motorcycle_driving_ability_str' => nil,
      'pol_nr_of_paid_claims_1_yr_str' => 'infield[:pol_nr_of_paid_claims_1_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_2_yr_str' => 'infield[:pol_nr_of_paid_claims_2_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_3_yr_str' => 'infield[:pol_nr_of_paid_claims_3_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_4_yr_str' => 'infield[:pol_nr_of_paid_claims_4_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_5_yr_str' => 'infield[:pol_nr_of_paid_claims_5_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_this_yr_str' => 'infield[:pol_nr_of_paid_claims_this_yr_str].strip.downcase',
      'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => 'sitass=infield[:pol_insurance_situation_str];  if sitass=~/1a*\\s*[(A-Za-z0-9)*(\\s)*]*/ ; x= 0; else x=5 end;',
      'pol_nr_of_yrs_without_claims_str' => 'infield[:pol_claims_total_number_str].to_i == 1 ? x=4 : x=5;',
      'pol_number_of_NI_NA_yrs_during_5_yrs_str' => 'sitass=infield[:pol_insurance_situation_str];  if sitass=~/1a*\\s*[(A-Za-z0-9)*(\\s)*]*/ ; x= 5; else x=0 end;',
      'pol_number_plate_type_str' => '"definitiva"',
      'pol_other_policies_with_company_str' => '"no"',
      'pol_other_vehicle_use_str' => '"no"',
      'pol_partner_garages_str' => '"no"',
      'pol_passenger_str' => nil,
      'pol_payment_str' => '"carta di credito"',
      'pol_pejus_cu_str' => nil,
      'pol_policy_starting_date_day_str' => '"si calcola runtime"',
      'pol_policy_starting_date_month_str' => '"si calcola runtime"',
      'pol_policy_starting_date_str' => '"si calcola runtime"',
      'pol_policy_starting_date_year_num' => '"si calcola runtime"',
      'pol_privacy_1_str' => '"id elemento web1"',
      'pol_privacy_2_str' => '"id elemento web2"',
      'pol_privacy_3_str' => '"id elemento web3"',
      'pol_property_type_to_be_insured_str' => '"autovettura"',
      'pol_public_liability_exemption_str' => 'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' => 'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',
      'pol_public_liability_type_str' => nil,
      'pol_public_liability_young_exemption_str ' => nil,
      'pol_quotation_str' => 'infield[:pol_quotation_str].strip.downcase',
      'pol_RCA_code_str' => '"RC"',
      'pol_RCA_on_off_str' => '"on"',
      'pol_RCA_premium_id_str' => '"id elemento"',
      'pol_record_id_str' => 'infield[:pol_record_id_str].strip',
      'pol_renounce_compensation_str' => '"no"',
      'pol_residence_province_str' => 'infield[:pol_residence_province_str].strip.upcase',
      'pol_residence_str' => 'infield[:pol_residence_str].strip.upcase',
      'pol_risk_certificate_str' => '"si"',
      'pol_second_claim_month_str' => nil,
      'pol_second_claim_year_str' => nil,
      'pol_second_driver_str' => nil,
      'pol_subscriber_is_driver_str' => 'if infield[:own_owner_sex_str].strip.upcase == "M"; "si"; elsif infield[:own_owner_sex_str].strip.upcase == "F"; "si"; else "no"; end',
      'pol_subscriber_is_holder_str' => '"si"',
      'pol_subscriber_is_owner_str' => 'if infield[:own_owner_sex_str].strip.upcase == "M"; "si"; elsif infield[:own_owner_sex_str].strip.upcase == "F"; "si"; else "no"; end',
      'pol_type_of_contract_str' => "'nuova polizza'",
      'pol_vehicle_continuous_use_no_of_mths_str' => nil,
      'veh_abs_str' => 'infield[:veh_abs_str].strip.downcase',
      'veh_accesories_value_str' => '"0"',
      'veh_airbag_str' => 'infield[:veh_airbag_str].strip.downcase',
      'veh_alarm_str' => '"nessuno"',
      'veh_antiskid_str' => '"no"',
      'veh_bersani_reference_vehicle_str' => '"no"',
      'veh_capacity_num' => 'infield[:veh_capacity_num].strip',
      'veh_corrosive_oily_gas_liquid_transportation_str' => nil,
      'veh_cv_num' => 'infield[:veh_cv_num].strip',
      'veh_fuel_str' => 'infield[:veh_fuel_str].strip.downcase',
      'veh_full_load_total_weight_num' => '"500"',
      'veh_gas_methane_supply_str' => '"no"',
      'veh_gprs_str' => '"no"',
      'veh_habitual_vehicle_use_str' => '"casa-lavoro tempo libero"',
      'veh_home_delivery_str' => nil,
      'veh_hook_str' => nil,
      'veh_inflammable_liquid_transportation_str' => nil,
      'veh_km_per_yr_str' => '10000',
      'veh_kw_num' => 'a=infield[:veh_kw_num].strip;',
      'veh_liquid_fuel_transportation_str' => nil,
      'veh_loading_unloading_str' => nil,
      'veh_make_previous_vehicle_str' => nil,
      'veh_make_str' => 'infield[:veh_make_str].strip',
      'veh_marble_blocks_str' => nil,
      'veh_model_str' => 'infield[:veh_model_str].strip',
      'veh_modification_made_str' => '"no"',
      'veh_new_used_vehicle_str' => '"N"',
      'veh_num_of_owners_str' => '"1"',
      'veh_passenger_transportation_str' => nil,
      'veh_product_sector_str' => nil,
      'veh_purchase_date_day_str' => 'infield[:pol_matriculation_date_str].strip',
      'veh_purchase_date_month_str' => 'infield[:pol_matriculation_date_str].strip',
      'veh_purchase_date_str' => 'infield[:pol_matriculation_date_str].strip',
      'veh_purchase_date_year_num' => 'infield[:pol_matriculation_date_str].strip',
      'veh_radioactive_substances_transportation_str' => nil,
      'veh_rent_str' => '"no"',
      'veh_rent_with_driver_str' => '"no"',
      'veh_set_up_previous_vehicle_str' => nil,
      'veh_set_up_str' => 'infield[:veh_set_up_str].strip',
      'veh_stabilizer_str' => '"no"',
      'veh_third_party_str' => nil,
      'veh_tow_hook_str' => '"no"',
      'veh_toxic_gas_explosive_transportation_str' => nil,
      'veh_transportation_of_dangerous_goods_A_str' => nil,
      'veh_transportation_of_dangerous_goods_B_str' => nil,
      'veh_transportation_type_str' => nil,
      'veh_truck_tractor_weight_num' => nil,
      'veh_use_for_shops_str' => nil,
      'veh_vehicle_for_disabled_str' => '"no"',
      'veh_vehicle_shelter_str' => '"box privato"',
      'veh_vehicle_type_str' => '"autovettura"',
      'veh_vehicle_use_str' => '"privato"',
      'veh_vehicle_value_str' => '"5000"',
      'veh_weight_to_be_towed_num' => nil,
      'pol_act_of_vandalism_code_str' => nil,
      'pol_act_of_vandalism_minimum_uncoverage_str' => nil,
      'pol_act_of_vandalism_on_off_str' => nil,
      'pol_act_of_vandalism_premium_id_str' => '"id elemento"',
      'pol_act_of_vandalisme_web_id_str' => '"id elemento"',
      'pol_assistance_code_str' => nil,
      'pol_assistance_on_off_str' => nil,
      'pol_assistance_premium_id_str' => '"id elemento"',
      'pol_assistance_web_id_str' => '"id elemento"',
      'pol_athmospheric_events_code_str' => nil,
      'pol_athmospheric_events_on_off_str' => nil,
      'pol_athmospheric_events_premium_id_str' => '"id elemento"',
      'pol_athmospheric_events_web_id_str' => '"id elemento"',
      'pol_blukasko_code_str' => nil,
      'pol_blukasko_on_off_str' => nil,
      'pol_blukasko_premium_id_str' => '"id elemento"',
      'pol_blukasko_web_id_str' => '"id elemento"',
      'pol_contingency_protection_code_str' => nil,
      'pol_contingency_protection_on_off_str' => nil,
      'pol_contingency_protection_premium_id_str' => '"id elemento"',
      'pol_contingency_protection_web_id_str' => '"id elemento"',
      'pol_driver_accident_coverage_code_str' => nil,
      'pol_driver_accident_coverage_on_off_str' => nil,
      'pol_driver_accident_coverage_premium_id_str' => '"id elemento"',
      'pol_driver_accident_coverage_web_id_str' => '"id elemento"',
      'pol_driving_licence_withdrawal_guarantee_code_str' => nil,
      'pol_driving_licence_withdrawal_guarantee_on_off_str' => nil,
      'pol_driving_licence_withdrawal_guarantee_premium_id_str' => '"id elemento"',
      'pol_driving_licence_withdrawal_guarantee_web_id_str' => '"id elemento"',
      'pol_easy_driver_code_str' => nil,
      'pol_easy_driver_on_off_str' => nil,
      'pol_easy_driver_premium_id_str' => '"id elemento"',
      'pol_easy_driver_web_id_str' => '"id elemento"',
      'pol_glasses_code_str' => nil,
      'pol_glasses_minimum_uncovered_str' => nil,
      'pol_glasses_on_off_str' => nil,
      'pol_glasses_premium_id_str' => '"id elemento"',
      'pol_glasses_web_id_str' => '"id elemento"',
      'pol_kasko_code_str' => nil,
      'pol_kasko_minimum_uncoverage_str' => nil,
      'pol_kasko_on_off_str' => nil,
      'pol_kasko_premium_id_str' => '"id elemento"',
      'pol_kasko_web_id_str' => '"id elemento"',
      'pol_legal_assistance_code_str' => nil,
      'pol_legal_assistance_on_off_str' => nil,
      'pol_legal_assistance_premium_id_str' => '"id elemento"',
      'pol_legal_assistance_web_id_str' => '"id elemento"',
      'pol_minikasko_code_str' => nil,
      'pol_minikasko_premium_id_str' => '"id elemento"',
      'pol_minikasko_web_id_str' => '"id elemento"',
      'pol_natural_events_act_of_vandalism_code_str' => nil,
      'pol_natural_events_act_of_vandalism_minimum_uncoverage_str' => nil,
      'pol_natural_events_act_of_vandalism_on_off_str' => nil,
      'pol_natural_events_act_of_vandalism_premium_id_str' => '"id elemento"',
      'pol_natural_events_act_of_vandalism_web_id_str' => '"id elemento"',
      'pol_natural_events_code_str' => nil,
      'pol_natural_events_on_off_str' => nil,
      'pol_natural_events_premium_id_str' => '"id elemento"',
      'pol_natural_events_web_id_str' => '"id elemento"',
      'pol_road_assistance_code_str' => nil,
      'pol_road_assistance_indemnity_limit_str' => nil,
      'pol_road_assistance_on_off_str' => nil,
      'pol_road_assistance_premium_id_str' => '"id elemento"',
      'pol_road_assistance_type_str' => nil,
      'pol_road_assistance_web_id_str' => '"id elemento"',
      'pol_social_political_and_natural_events_code_str' => nil,
      'pol_social_political_and_natural_events_on_off_str' => nil,
      'pol_social_political_and_natural_events_premium_id_str' => '"id elemento"',
      'pol_social_political_and_natural_events_web_id_str' => '"id elemento"',
      'pol_social_political_events_code_str' => nil,
      'pol_social_political_events_on_off_str' => nil,
      'pol_social_political_events_premium_id_str' => '"id elemento"',
      'pol_social_political_events_web_id_str' => '"id elemento"',
      'pol_supplementary_coverage_code_str' => nil,
      'pol_supplementary_coverage_on_off_str' => nil,
      'pol_supplementary_coverage_premium_id_str' => '"id elemento"',
      'pol_supplementary_coverage_web_id_str' => '"id elemento"',
      'pol_theft_fire_coverage_code_str' => nil,
      'pol_theft_fire_coverage_on_off_str' => nil,
      'pol_theft_fire_coverage_premium_id_str' => nil,
      'pol_theft_fire_coverage_web_id_str' => '"id elemento"',
      'pol_theft_fire_minimum_uncoverage_exemption_str' => nil,
      'pol_collision_code_str' => nil,
      'pol_collision_on_off_str' => nil,
      'pol_collision_premium_id_str' => nil,
      'pol_collision_web_id_str' => nil,
      'pol_protected_bonus_code_str' => nil,
      'pol_protected_bonus_on_off_str' => nil,
      'pol_protected_bonus_premium_id_str' => nil,
      'pol_protected_bonus_web_id_str' => nil,
      'pol_protection_24_code_str' => nil,
      'pol_protection_24_on_off_str' => nil,
      'pol_protection_24_premium_id_str' => nil,
      'pol_protection_24_web_id_str' => nil,


    }
  end

end