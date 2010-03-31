module Provider1Conte

  def build_hash_sect_1()

    @rule_values ={}

    @rule_values = {
      'pol_RCA_code_str' =>  'copy_field',
      'pol_BM_1_more_than_1_year_str' => 'copy_field',
      'pol_public_liability_young_exemption_str' => 'copy_field',
      'pol_pejus_cu_str' => 'copy_field',
      'pol_BM_in_risk_certificate_str' => 'copy_field',
      'pol_minikasko_premium_id_str' => 'copy_field',
      'pol_minikasko_web_id_str' => 'translate_field',
      'pol_natural_events_code_str' => 'copy_field',
      'pol_natural_events_web_id_str' => 'translate_field',
      'veh_set_up_previous_vehicle_str' => 'copy_field',
      'veh_make_previous_vehicle_str' => 'copy_field',
      'pol_claims_total_number_malus_str'=> 'copy_field',
      'driv_driving_experience_str'=> 'copy_field',
      'veh_cv_num'=> 'copy_field',
     'driv_driving_license_month_of_issue_str' => 'x= (Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years + 18.years).strftime("%-1m"); y="index=" + x',
      'pol_record_id_str' => 'copy_field',
      'driv_driver_sex_str' => 'translate_field',
      'pol_birth_date_day_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d")',
      'pol_birth_date_month_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%m")',
      'pol_birth_date_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d/%m/%Y")',
      'pol_birth_date_year_num' => '(Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d/%m/%Y")',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_matriculation_date_day_str' => 'profilefield[:pol_matriculation_date_str] == 10 ? copy_field : (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%d")',
      'pol_matriculation_date_month_str' => 'x = (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%-1m"); y= "index=" + x',
      'pol_matriculation_date_str' => 'profilefield[:pol_matriculation_date_str] == 10 ? copy_field : (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%m/%Y")',
      'pol_matriculation_date_year_num' => 'profilefield[:pol_matriculation_date_str] == 10 ? copy_field : (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%Y")',
      'pol_policy_starting_date_str' => 'copy_field',
      'pol_RCA_premium_id_str' => 'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'veh_alarm_str' => 'translate_field',
      'veh_km_per_yr_str' => 'translate_field',
      'veh_make_str' => 'make=profilefield[:veh_make_str];  make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" ); make= make.gsub(/ª/,"a" ); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:^";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "\\\\b";',
      'veh_model_str' => 'make=profilefield[:veh_model_str]; make= make.gsub(/à/,"a" ); make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" );   regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "$";',
      'veh_set_up_str' => 'make=profilefield[:veh_set_up_str];make= make.gsub(/à/,"a" );make= make.gsub(/ì/,"i" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" );  make= make.gsub(/(\\s)+ie(\\s)+/i, " i.e. ");  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "$";',
      'veh_vehicle_value_str' => 'copy_field',
      'driv_driving_license_yrs_str' => '18',
      'pol_how_do_you_know_the_company_str' => 'translate_field',
      'veh_habitual_vehicle_use_str' => 'translate_field',
      'veh_vehicle_shelter_str' => 'translate_field',
      'pol_residence_str' => 'copy_field',
      'own_owner_specification_str' => 'copy_field',
      'own_owner_residence_province_str' =>  'translate_field'   ,
      'own_owner_residence_str' =>  'copy_field',
      'driv_birth_state_str' => 'copy_field',
      'pol_minikasko_code_str' => 'copy_field',
      #      'driv_job_str' => 'job=profilefield[:driv_job_str]; jregexp_mod = "regexpi:([A-Za-z0-9])*(";jregexpi_mod_array = job.split("/"); jregexpi_mod_array.each do |el| ;el_array= el.split(" "); el_array.each do |el2|; el2.length < 3 ? nil : jregexp_mod = jregexp_mod + "(" + el2.to_s + ".*)|" end;end ;jregexp_mod = jregexp_mod + "(niente))\\\\b"',
      'driv_job_str' => 'translate_field',
      'pol_matriculation_date_day_str' => 'profilefield[:pol_matriculation_date_str] == 10 ? copy_field : (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%d")',
      'driv_job_2_str' => 'copy_field',
      'pol_bersani_str' => 'translate_field',
      'driv_civil_status_str' => 'translate_field',
      'pol_driver_zip_code_str' => 'copy_field',
      'pol_subscriber_is_driver_str' => 'translate_field',
      'pol_subscriber_is_owner_str' => 'profilefield[:own_owner_specification_str] == "C" ? "page:contraente_proprietario:1" : "page:contraente_proprietario:0"',
      'veh_purchase_date_str' => '(Chronic.parse(@rate_date) - profilefield[:veh_purchase_date_str].to_i.years).strftime("%d/%m/%Y")',
      'veh_purchase_date_year_num' => '(Chronic.parse(@rate_date) - profilefield[:veh_purchase_date_str].to_i.years).strftime("%Y")',
      'veh_purchase_date_month_str' => '(Chronic.parse(@rate_date) - profilefield[:veh_purchase_date_str].to_i.years).strftime("%m")',
      'veh_purchase_date_day_str' => '(Chronic.parse(@rate_date) - profilefield[:veh_purchase_date_str].to_i.years).strftime("%d")',
      'driv_citizenship_str' => 'profilefield[:driv_citizenship_str]== "ITALIA" ?  "page:conducente_nazione:0" : "page:conducente_nazione:1"',
      'pol_residence_province_str' => 'translate_field',
      'pol_glasses_code_str' => 'copy_field',
      'pol_kasko_minimum_uncoverage_str' => 'copy_field',
      'pol_payment_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'driv_birth_place_str' => 'copy_field',
      'driv_birth_province_str' => 'translate_field',
      'driv_driving_license_points_str' => 'translate_field',
      'driv_driving_license_type_str' => 'translate_field',
      'driv_italian_residence_starting_yrs_num' => 'copy_field',
      'driv_residence_same_as_home_address_str' => 'translate_field',
      'pol_cohabiting_children_str' => 'translate_field',
      'pol_defined_drive_str' => 'copy_field',
      'pol_driving_license_suspension_str' => 'translate_field',
      'pol_drunkenness_fine_str' => 'translate_field',
      'pol_exclusive_drive_str' => 'copy_field',
      'pol_free_drive_str' => 'copy_field',
      'pol_other_vehicle_use_str' => 'translate_field',
      'pol_driver_less_than_26_yrs_str'=> 'copy_field' ,
      'pol_privacy_1_str' => 'translate_field',
      'pol_road_assistance_type_str' => 'copy_field',
      'pol_theft_fire_minimum_uncoverage_exemption_str' => 'copy_field',
      'veh_modification_made_str' => 'translate_field',
      'veh_new_used_vehicle_str' => 'translate_field',
      'pol_act_of_vandalism_on_off_str' => 'copy_field',
      'pol_act_of_vandalism_code_str' => 'copy_field',
      'pol_kasko_minimum_uncoverage_str' => 'copy_field',
      'pol_kasko_code_str' => 'copy_field',
      'pol_driver_accident_indemnity_limit_str' => 'copy_field',
      'pol_driver_less_than_26_yrs_str' => 'copy_field',
      'own_owner_sex_str' => 'translate_field',
      'pol_leasing_str' => 'copy_field',
      'pol_nr_of_paid_claims_1_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'copy_field',
      'veh_gas_methane_supply_str' => 'copy_field',
      'driv_driving_license_year_of_issue_str' => 'x= (Chronic.parse(@rate_date) - profilefield[:pol_birth_date_str].to_i.years + 18.years).strftime("%Y")',
      'pol_athmospheric_events_code_str' => 'copy_field',
      'pol_driver_accident_coverage_code_str' => 'copy_field',
      'pol_driver_is_owner_str' => 'copy_field',
      'pol_social_political_events_code_str' => 'copy_field',
      'veh_accesories_value_str' => 'copy_field',
      'pol_assistance_code_str' => 'copy_field',
      'veh_vehicle_use_str' => 'copy_field',
      'own_owner_zip_code_str' => 'copy_field',
      #      'pol_bersani_ref_car_already_insured_with_company_str' => 'copy_field',
      'pol_car_already_insured_with_company_str' => 'copy_field',
      'pol_coming_from_BM_str' => 'copy_field',
      'pol_family_car_num' => 'copy_field',
      'pol_family_members_insured_with_company_str' => 'copy_field',
      'pol_public_liability_exemption_str' => 'copy_field',
      'pol_client_type_str' => 'translate_field',
      'pol_coming_from_company_str' => 'copy_field',
      'pol_glasses_minimum_uncovered_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_code_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'x= profilefield[:pol_nr_of_paid_claims_this_yr_str].to_i; y= profilefield[:pol_nr_of_paid_claims_1_yr_str].to_i; z= profilefield[:pol_nr_of_paid_claims_2_yr_str]; z== "N/A" ? sin= x+y+z.to_i : sin= x+y',
      'pol_nr_of_paid_claims_3_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_4_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_this_yr_str' => 'copy_field',
      'pol_first_claim_month_str' => 'copy_field',
      'pol_first_claim_year_str' => 'Chronic.parse(profilefield[:pol_first_claim_year_str].to_s + " years before now").strftime("%Y")',
      'pol_second_claim_month_str' => 'copy_field',
      'pol_second_claim_year_str'  => 'Chronic.parse(profilefield[:pol_second_claim_year_str].to_s + " years before now").strftime("%Y")',
      'pol_driving_type_str' => '(profilefield[:pol_birth_date_str].to_i > 27 && profilefield[:own_owner_specification_str] != "C" )? translate_field : "page:radioGuidatori:2"',
      'driv_heir_str' => 'copy_field',
      'driv_studies_str' => 'copy_field',
      'own_company_title_str' => 'copy_field',
      'own_company_type_str' => 'copy_field',
      'pol_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_act_of_vandalism_code_str' => 'copy_field',
      'pol_already_benefit_from_bersani_str' => 'copy_field',
      'pol_bersani_policy_expiring_date_str' => 'copy_field',
      'pol_bersani_ref_vehicle_number_plate_str' => 'copy_field',
      'pol_blukasko_code_str' => 'copy_field',
      'pol_claims_total_number_str' => 'x= profilefield[:pol_nr_of_paid_claims_this_yr_str].to_i; y= profilefield[:pol_nr_of_paid_claims_1_yr_str].to_i; z= profilefield[:pol_nr_of_paid_claims_2_yr_str]; z== "N/A" ? sin= x+y+z.to_i : sin= x+y ; sin > 0 ? "page:sinistri_cc:0" : "page:sinistri_cc:1" ',
      'pol_contingency_protection_code_str' => 'copy_field',
      'pol_current_policy_guarantee_str' => 'copy_field',
      'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'copy_field',
      'pol_driving_license_withdrawal_indemnity_limit_str' => 'copy_field',
      'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'pol_number_of_NI_NA_yrs_during_5_yrs_str' => 'copy_field',
      'pol_number_plate_type_str' => 'copy_field',
      'pol_partner_garages_str' => 'copy_field',
      'pol_privacy_2_str' => 'copy_field',
      'pol_privacy_3_str' => 'copy_field',
      'pol_property_type_to_be_insured_str' => 'copy_field',
      'pol_quotation_str' => 'copy_field',
      'pol_renounce_compensation_str' => 'copy_field',
      'pol_risk_certificate_str' => 'copy_field',
      'pol_road_assistance_indemnity_limit_str' => 'copy_field',
      'pol_social_political_and_natural_events_code_str' => 'copy_field',
      'pol_type_of_contract_str' => 'copy_field',
      #      'pol_vat_number_str' => 'copy_field',
      'veh_abs_str' => 'copy_field',
      'veh_airbag_str' => 'copy_field',
      'veh_antiskid_str' => 'copy_field',
      'veh_bersani_reference_vehicle_str' => 'copy_field',
      'veh_gprs_str' => 'copy_field',
      'veh_kw_num' => 'copy_field',
      'veh_cf_num' => 'copy_field',
      'veh_capacity_num' => 'copy_field',
      'veh_stabilizer_str' => 'copy_field',
      'veh_tow_hook_str' => 'copy_field',
      'veh_vehicle_for_disabled_str' => 'copy_field',
      'veh_vehicle_type_str' => 'copy_field',
      'veh_num_of_owners_str' => 'copy_field',
      'pol_other_policies_with_company_str' => 'copy_field',
      'pol_BM_particular_cases_str' => 'copy_field',
      'pol_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_act_of_vandalisme_web_id_str' => 'copy_field',
      'pol_act_of_vandalism_premium_id_str' => 'copy_field',
      'pol_assistance_on_off_str' => 'copy_field',
      'pol_assistance_web_id_str' => 'copy_field',
      'pol_assistance_premium_id_str' => 'copy_field',
      'pol_athmospheric_events_on_off_str' => 'copy_field',
      'pol_athmospheric_events_web_id_str' => 'copy_field',
      'pol_athmospheric_events_premium_id_str' => 'copy_field',
      'pol_blukasko_on_off_str' => 'copy_field',
      'pol_blukasko_web_id_str' => 'copy_field',
      'pol_blukasko_premium_id_str' => 'copy_field',
      'pol_contingency_protection_on_off_str' => 'copy_field',
      'pol_contingency_protection_web_id_str' => 'copy_field',
      'pol_contingency_protection_premium_id_str' => 'copy_field',
      'pol_driver_accident_coverage_on_off_str' => 'copy_field',
      'pol_driver_accident_coverage_web_id_str'  => 'translate_field' ,
      'pol_driver_accident_indemnity_limit_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_code_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_on_off_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_web_id_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_premium_id_str' => 'copy_field',
      'pol_easy_driver_code_str' => 'copy_field',
      'pol_easy_driver_on_off_str' => 'copy_field',
      'pol_easy_driver_web_id_str' => 'copy_field',
      'pol_easy_driver_premium_id_str' => 'copy_field',
      'pol_glasses_minimum_uncovered_str' => 'copy_field',
      'pol_glasses_on_off_str' => 'copy_field',
      'pol_glasses_web_id_str' => 'translate_field',
      'pol_glasses_premium_id_str' => 'copy_field',
      'pol_kasko_on_off_str' => 'copy_field',
      'pol_kasko_web_id_str' => 'translate_field',
      'pol_kasko_premium_id_str' => 'copy_field',
      'pol_legal_assistance_code_str' => 'copy_field',
      'pol_legal_assistance_on_off_str' => 'copy_field',
      'pol_legal_assistance_web_id_str' => 'translate_field',
      'pol_legal_assistance_premium_id_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism,' => 'copy_field',
      'pol_natural_events_act_of_vandalism_on_off_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_web_id_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_premium_id_str' => 'copy_field',
      'pol_natural_events_on_off_str' => 'copy_field',
      'pol_natural_events_web_id_str' => 'translate_field',
      'pol_subscriber_is_holder_str'=> 'copy_field' ,
      'pol_natural_events_premium_id_str' => 'copy_field',
      'pol_road_assistance_code_str' => 'copy_field',
      'pol_road_assistance_on_off_str' => 'copy_field',
      'pol_road_assistance_web_id_str' => 'translate_field',
      'pol_road_assistance_premium_id_str' => 'copy_field',
      'pol_theft_fire_coverage_code_str'=> 'copy_field' ,
      'pol_theft_fire_coverage_on_off_str'=> 'copy_field' ,
      'pol_theft_fire_coverage_web_id_str'=> 'translate_field' ,
      'pol_theft_fire_coverage_premium_id_str'=> 'copy_field' ,
      'pol_vehicle_continuous_use_no_of_mths_str'=> 'copy_field' ,
      'veh_home_delivery_str'=> 'copy_field' ,
      'veh_hook_str'=> 'copy_field' ,
      'veh_inflammable_liquid_transportation_str'=> 'copy_field' ,
      'veh_liquid_fuel_transportation_str'=> 'copy_field' ,
      'veh_loading_unloading_str'=> 'copy_field' ,
      'veh_corrosive_oily_gas_liquid_transportation_str'=> 'copy_field' ,
      'veh_full_load_total_weight_num'=> 'copy_field' ,
      'pol_motorcycle_driving_ability_str'=> 'copy_field' ,
      'pol_social_political_and_natural_events_on_off_str' => 'copy_field',
      'pol_social_political_and_natural_events_web_id_str' => 'copy_field',
      'pol_social_political_and_natural_events_premium_id_str' => 'copy_field',
      'pol_public_liability_type_str'=> 'copy_field' ,
      'pol_second_driver_str'=> 'copy_field' ,
      'pol_social_political_events_on_off_str' => 'copy_field',
      'pol_passenger_str'=> 'copy_field' ,
      'pol_policy_starting_date_year_num'=> 'copy_field' ,
      'pol_policy_starting_date_month_str'=> 'copy_field' ,
      'pol_policy_starting_date_day_str'=> 'copy_field' ,
      'pol_social_political_events_web_id_str' => 'copy_field',
      'pol_social_political_events_premium_id_str' => 'copy_field',
      'pol_supplementary_coverage_code_str' => 'copy_field',
      'pol_supplementary_coverage_on_off_str' => 'copy_field',
      'pol_supplementary_coverage_web_id_str' => 'copy_field',
      'pol_supplementary_coverage_premium_id_str' => 'copy_field',
      'veh_marble_blocks_str'=> 'copy_field' ,
      'veh_passenger_transportation_str'=> 'copy_field' ,
      'veh_product_sector_str'=> 'copy_field' ,
      'veh_radioactive_substances_transportation_str'=> 'copy_field' ,
      'veh_rent_str'=> 'copy_field' ,
      'veh_rent_with_driver_str'=> 'copy_field' ,
      'veh_third_party_str'=> 'copy_field' ,
      'veh_toxic_gas_explosive_transportation_str'=> 'copy_field' ,
      'veh_transportation_of_dangerous_goods_A_str'=> 'copy_field' ,
      'veh_transportation_of_dangerous_goods_B_str'=> 'copy_field' ,
      'veh_transportation_type_str'=> 'copy_field' ,
      'veh_truck_tractor_weight_num'=> 'copy_field' ,
      'veh_use_for_shops_str'=> 'copy_field' ,
      'veh_weight_to_be_towed_num'=> 'copy_field' ,
      'pol_kasko_minimum_uncoverage'=> 'copy_field' ,
      'pol_natural_events_act_of_vandalism'=> 'copy_field' ,
      'pol_social_political_and_natural_events'=> 'copy_field',
      'pol_bersani_ref_vehicle_insured_with_company_str'=> 'copy_field' ,
      'pol_collision_code_str' => 'copy_field' ,
      'pol_collision_on_off_str' => 'copy_field' ,
      'pol_collision_premium_id_str' => 'copy_field' ,
      'pol_collision_web_id_str' => 'copy_field' ,
      'pol_protected_bonus_code_str' => 'copy_field' ,
      'pol_protected_bonus_on_off_str' => 'copy_field' ,
      'pol_protected_bonus_premium_id_str' => 'copy_field' ,
      'pol_protected_bonus_web_id_str' => 'copy_field' ,
      'pol_protection_24_code_str' => 'copy_field' ,
      'pol_protection_24_on_off_str' => 'copy_field' ,
      'pol_protection_24_premium_id_str' => 'copy_field' ,
      'pol_protection_24_web_id_str' => 'copy_field' ,
      'pol_driver_accident_coverage_premium_id_str' => 'copy_field' ,
    }

  end

end