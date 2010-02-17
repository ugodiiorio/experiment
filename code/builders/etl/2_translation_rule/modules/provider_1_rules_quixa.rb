#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Rules_Quixa

#  def build_hash_regexp_sect_1_prov_1()  a regime i provider si chiameranno prov_1 etc
def build_hash_rules_sect_1_provider_1()
#     target_values["fname_fvalue"]

    @rule_values = Hash.new

    @rule_values ={}

    @rule_values = { 
      'pol_record_id_str' => 'copy_field',
'pol_driver_accident_indemnity_limit_str' => 'copy_field',
'pol_glasses_minimum_uncovered_str' => 'copy_field',
'pol_glasses_str' => 'copy_field',
'pol_kasko_minimum_uncoverage_str' => 'copy_field',
'pol_kasko_str' => 'copy_field',
'pol_legal_assistance_str' => 'copy_field',
'pol_natural_events_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
'pol_natural_events_act_of_vandalism_str' => 'copy_field',
'pol_residence_str' => 'copy_field',
'pol_supplementary_coverage_str' => 'copy_field',
'pol_theft_fire_coverage_str' => 'copy_field',
'driv_birth_place_str' => 'copy_field',
'driv_birth_province_str' => 'copy_field',
'driv_birth_state_str' => 'copy_field',
'driv_civil_status_str' => 'copy_field',
'driv_driving_license_points_str' => 'copy_field',
'driv_driving_license_type_str' => 'copy_field',
'driv_driving_license_year_of_issue_str' => 'copy_field',
'driv_driving_license_yrs_str' => 'copy_field',
'driv_driver_sex_str' => 'copy_field',
'driv_heir_str' => 'copy_field',
'driv_italian_residence_starting_yrs_num' => 'copy_field',
'driv_residence_same_as_home_address_str' => 'copy_field',
'driv_studies_str' => 'copy_field',
'own_company_title_str' => 'copy_field',
'own_company_type_str' => 'copy_field',
'own_owner_sex_str' => 'copy_field',
'own_owner_zip_code_str' => 'copy_field',
'pol_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
'pol_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
'pol_act_of_vandalism_str' => 'copy_field',
'pol_already_benefit_from_bersani_str' => 'copy_field',
'pol_athmospheric_events_str' => 'copy_field',
'pol_bersani_policy_expiring_date_str' => 'copy_field',
'pol_bersani_ref_car_already_insured_with_company_str' => 'copy_field',
'pol_bersani_ref_vehicle_number_plate_str' => 'copy_field',
'pol_blukasko_str' => 'copy_field',
'pol_BM_particular_cases_str' => 'copy_field',
'pol_car_already_insured_with_company_str' => 'copy_field',
'pol_claims_total_number_str' => 'copy_field',
'pol_cohabiting_children_str' => 'copy_field',
'pol_coming_from_BM_num' => 'copy_field',
'pol_contingency_protection_str' => 'copy_field',
'pol_current_policy_guarantee_str' => 'copy_field',
'pol_defined_drive_str' => 'copy_field',
'pol_driver_accident_coverage_str' => 'copy_field',
'pol_driver_accident_str' => 'copy_field',
'pol_driver_is_owner_str' => 'copy_field',
'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'copy_field',
'pol_driver_type_str' => 'copy_field',
'pol_driver_zip_code_str' => 'copy_field',
'pol_driving_licence_withdrawal_guarantee_str' => 'copy_field',
'pol_driving_license_suspension_str' => 'copy_field',
'pol_driving_license_withdrawal_indemnity_limit_str' => 'copy_field',
'pol_driving_type_str' => 'copy_field',
'pol_drunkenness_fine_str' => 'copy_field',
'pol_easy_driver_str' => 'copy_field',
'pol_exclusive_drive_str' => 'copy_field',
'pol_family_car_num' => 'copy_field',
'pol_family_members_insured_with_company_str' => 'copy_field',
'pol_free_drive_str' => 'copy_field',
'pol_how_do_you_know_the_company_str' => 'copy_field',
'pol_minikasko_str' => 'copy_field',
'pol_natural_events_str' => 'copy_field',
'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => 'copy_field',
'pol_nr_of_yrs_without_claims_str' => 'copy_field',
'pol_number_of_NI_NA_yrs_during_5_yrs_str' => 'copy_field',
'pol_number_plate_type_str' => 'copy_field',
'pol_other_policies_with_company_str' => 'copy_field',
'pol_other_vehicle_use_str' => 'copy_field',
'pol_partner_garages_str' => 'copy_field',
'pol_privacy_1_str' => 'copy_field',
'pol_privacy_2_str' => 'copy_field',
'pol_privacy_3_str' => 'copy_field',
'pol_property_type_to_be_insured_str' => 'copy_field',
'pol_public_liability_exemption_str' => 'copy_field',
'pol_quotation_str' => 'copy_field',
'pol_renounce_compensation_str' => 'copy_field',
'pol_risk_certificate_str' => 'copy_field',
'pol_road_assistance_indemnity_limit_str' => 'copy_field',
'pol_road_assistance_str' => 'copy_field',
'pol_road_assistance_type_str' => 'copy_field',
'pol_social_political_and_natural_events_str' => 'copy_field',
'pol_social_political_events_str' => 'copy_field',
'pol_subscriber_is_driver_str' => 'copy_field',
'pol_subscriber_is_owner_str' => 'copy_field',
'pol_theft_fire_minimum_uncoverage_exemption_str' => 'copy_field',
'pol_type_of_contract_str' => 'copy_field',
'pol_vat_number_str' => 'copy_field',
'veh_abs_str' => 'copy_field',
'veh_accesories_value_str' => 'copy_field',
'veh_airbag_str' => 'copy_field',
'veh_antiskid_str' => 'copy_field',
'veh_bersani_reference_vehicle_str' => 'copy_field',
'veh_capacity_num' => 'copy_field',
'veh_cf_num' => 'copy_field',
'veh_gprs_str' => 'copy_field',
'veh_habitual_vehicle_use_str' => 'translate_field',
'veh_kw_num' => 'copy_field',
'veh_modification_made_str' => 'copy_field',
'veh_new_used_vehicle_str' => 'copy_field',
'veh_num_of_owners_str' => 'copy_field',
'veh_purchase_date_str' => 'copy_field',
'veh_stabilizer_str' => 'copy_field',
'veh_tow_hook_str' => 'copy_field',
'veh_vehicle_for_disabled_str' => 'copy_field',
'veh_vehicle_shelter_str' => 'copy_field',
'veh_vehicle_type_str' => 'copy_field',
'pol_assistance_str' => 'translate_field',
'pol_bersani_str' => 'translate_field',
'pol_BM_assigned_str' => 'translate_field',
'pol_client_type_str' => 'translate_field',
'pol_coming_from_company_str' => 'translate_field',
'pol_driver_less_than_26_yrs_str' => 'translate_field',
'pol_driver_sex_str' => 'translate_field',
'pol_instalment_str' => 'translate_field',
'pol_insurance_situation_str' => 'translate_field',
'pol_leasing_str' => 'translate_field',
'pol_nr_of_paid_claims_1_yr_str' => 'translate_field',
'pol_nr_of_paid_claims_2_yr_str' => 'translate_field',
'pol_nr_of_paid_claims_3_yr_str' => 'translate_field',
'pol_nr_of_paid_claims_4_yr_str' => 'translate_field',
'pol_nr_of_paid_claims_5_yr_str' => 'translate_field',
'pol_nr_of_paid_claims_this_yr_str' => 'translate_field',
'pol_payment_str' => 'translate_field',
'pol_premium_id_str' => 'translate_field',
'pol_public_liability_indemnity_limit_str' => 'translate_field',
'pol_residence_province_str' => 'translate_field',
'veh_alarm_str' => 'translate_field',
'veh_fuel_str' => 'translate_field',
'veh_km_per_yr_num' => 'translate_field',
'veh_set_up_str' => 'make=profilefield[:veh_set_up_str]; regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*"; regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end; regexp_mod = regexp_mod + "\\\\b";',
'veh_vehicle_use_str' => 'translate_field',
'veh_vehicle_value_str' => 'translate_field',
'driv_citizenship_str' => 'copy_field',
'driv_job_str' => 'job=profilefield[:driv_job_str];  regexpi_mod_array = job.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "\\\\b";',
'driv_job_2_str' => 'copy_field',
'own_owner_specification_str' => 'translate_field',
'pol_birth_date_str' => 'data= Date.parse(profilefield[:pol_birth_date_str]);european_date = \'%d/%m/%Y\';data = data.strftime(european_date).to_s',
'pol_birth_date_year_num' => 'data= Date.parse(profilefield[:pol_birth_date_str]);european_date = \'%Y\';data = data.strftime(european_date).to_s',
'pol_birth_date_month_str' => 'data= Date.parse(profilefield[:pol_birth_date_str]);european_date = \'%m\';data = data.strftime(european_date).to_s',
'pol_birth_date_day_str' => 'data= Date.parse(profilefield[:pol_birth_date_str]);european_date = \'%d\';data = data.strftime(european_date).to_s',
'pol_matriculation_date_str' => 'data= Date.parse(profilefield[:pol_matriculation_date_str]);european_date = \'%m/%Y\';data = data.strftime(european_date).to_s',
'pol_matriculation_date_year_num' => 'data= Date.parse(profilefield[:pol_matriculation_date_str]);european_date = \'%Y\';data = data.strftime(european_date).to_s',
'pol_matriculation_date_month_str' => 'data= Date.parse(profilefield[:pol_matriculation_date_str]);european_date = \'%m\';data = data.strftime(european_date).to_s',
'pol_matriculation_date_day_str' => 'data= Date.parse(profilefield[:pol_matriculation_date_str]);european_date = \'%d\';data = data.strftime(european_date).to_s',
'pol_policy_starting_date_str' => 'copy_field',
'veh_make_str' => 'make=profilefield[:veh_make_str];  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*"; regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end; regexp_mod = regexp_mod + "\\\\b";' ,
'veh_model_str' => 'make=profilefield[:veh_model_str];  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*"; regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end; regexp_mod = regexp_mod + "\\\\b";',
'pol_legal_assistance_str' => 'copy_field',
'pol_on_off_social_political_and_natural_events_str' => 'copy_field',
'pol_social_political_and_natural_events_web_id_str' => 'copy_field',
'pol_social_political_events_web_id_str' => 'copy_field',
'pol_social_political_events_premium_id_str' => 'copy_field',
'pol_on_off_supplementary_coverage_str' => 'copy_field',
'pol_act_of_vandalism_str' => 'copy_field',
'pol_on_off_act_of_vandalism_str' => 'copy_field',
'pol_act_of_vandalisme_web_id_str' => 'copy_field',
'pol_assistance_str' => 'copy_field',
'pol_on_off_assistance_str' => 'copy_field',
'pol_assistance_web_id_str' => 'copy_field',
'pol_assistance_premium_id_str' => 'copy_field',
'pol_athmospheric_events_str' => 'copy_field',
'pol_on_off_athmospheric_events_str' => 'copy_field',
'pol_athmospheric_events_web_id_str' => 'copy_field',
'pol_blukasko_str' => 'copy_field',
'pol_on_off_blukasko_str' => 'copy_field',
'pol_blukasko_web_id_str' => 'copy_field',
'pol_blukasko_premium_id_str' => 'copy_field',
'pol_contingency_protection_str' => 'copy_field',
'pol_contingency_protection_web_id_str' => 'copy_field',
'pol_contingency_protection_premium_id_str' => 'copy_field',
'pol_driver_accident_coverage_str' => 'copy_field',
'pol_on_off_driver_accident_coverage_str' => 'copy_field',
'pol_driver_accident_coverage_web_id_str' => 'copy_field',
'pol_driver_accident_indemnity_limit_str' => 'copy_field',
'pol_driving_licence_withdrawal_guarantee_str' => 'copy_field',
'pol_on_off_driving_licence_withdrawal_guarantee_str' => 'copy_field',
'pol_driving_licence_withdrawal_guarantee_web_id_str' => 'copy_field',
'pol_on_off_easy_driver_str' => 'copy_field',
'pol_easy_driver_premium_id_str' => 'copy_field',
'pol_glasses_minimum_uncovered_str' => 'copy_field',
'pol_glasses_str' => 'copy_field',
'pol_glasses_web_id_str' => 'copy_field',
'pol_glasses_premium_id_str' => 'copy_field',
'pol_kasko_str' => 'copy_field',
'pol_on_off_kasko_str' => 'copy_field',
'pol_kasko_web_id_str' => 'copy_field',
'pol_kasko_premium_id_str' => 'copy_field',
'pol_on_off_legal_assistance_str' => 'copy_field',
'pol_legal_assistance_web_id_str' => 'copy_field',
'pol_legal_assistance_premium_id_str' => 'copy_field',
'pol_on_off_natural_events_act_of_vandalism_str' => 'copy_field',
'pol_natural_events_act_of_vandalism_web_id_str' => 'copy_field',
'pol_natural_events_act_of_vandalism_premium_id_str' => 'copy_field',
'pol_natural_events_str' => 'copy_field',
'pol_on_off_natural_events_str' => 'copy_field',
'pol_natural_events_web_id_str' => 'copy_field',
'pol_natural_events_premium_id_str' => 'copy_field',
'pol_road_assistance_str' => 'copy_field',
'pol_on_off_road_assistance_str' => 'copy_field',
'pol_road_assistance_web_id_str' => 'copy_field',
'pol_road_assistance_premium_id_str' => 'copy_field',
'pol_social_political_and_natural_events_str' => 'copy_field',
'pol_social_political_and_natural_events_premium_id_str' => 'copy_field',
'pol_supplementary_coverage_premium_id_str' => 'copy_field',
'pol_driver_accident_coverage_premium_id_str' => 'copy_field',
'pol_driving_licence_withdrawal_guarantee_premium_id_str' => 'copy_field',
'pol_easy_driver_web_id_str' => 'copy_field',
'pol_on_off_glasses_str' => 'copy_field',
'pol_kasko_minimum_uncoverage_str' => 'copy_field',
'pol_natural_events_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
'pol_natural_events_act_of_vandalism,' => 'copy_field',
'pol_social_political_events_str' => 'copy_field',
'pol_on_off_social_political_events_str' => 'copy_field',
'pol_supplementary_coverage_str' => 'copy_field',
'pol_act_of_vandalism_premium_id_str' => 'copy_field',
'pol_athmospheric_events_premium_id_str' => 'copy_field',
'pol_on_off_contingency_protection_str' => 'copy_field',
'pol_easy_driver_str' => 'copy_field',
'pol_supplementary_coverage_web_id_str' => 'copy_field',
 'pol_act_of_vandalism_code_str'=> 'copy_field' ,
 'pol_additional_drivers_less_than_26_yrs_str'=> 'copy_field' ,
 'pol_bersani_ref_vehicle_insured_with_company_str'=> 'copy_field' ,
 'pol_motorcycle_driving_ability_str'=> 'copy_field' ,
 'pol_passenger_str'=> 'copy_field' ,
 'pol_policy_starting_date_year_num'=> 'copy_field' ,
 'pol_policy_starting_date_month_str'=> 'copy_field' ,
 'pol_policy_starting_date_day_str'=> 'copy_field' ,
 'pol_public_liability_type_str'=> 'copy_field' ,
 'pol_second_driver_str'=> 'copy_field' ,
 'pol_subscriber_is_holder_str'=> 'copy_field' ,
 'pol_theft_fire_coverage_code_str'=> 'copy_field' ,
 'pol_on_off_theft_fire_coverage_str'=> 'copy_field' ,
 'pol_theft_fire_coverage_web_id_str'=> 'copy_field' ,
 'pol_theft_fire_coverage_premium_id_str'=> 'copy_field' ,
 'pol_vehicle_continuous_use_no_of_mths_str'=> 'copy_field' ,
 'veh_corrosive_oily_gas_liquid_transportation_str'=> 'copy_field' ,
 'veh_full_load_total_weight_num'=> 'copy_field' ,
 'veh_gas_methane_supply_str'=> 'copy_field' ,
 'veh_home_delivery_str'=> 'copy_field' ,
 'veh_hook_str'=> 'copy_field' ,
 'veh_inflammable_liquid_transportation_str'=> 'copy_field' ,
 'veh_liquid_fuel_transportation_str'=> 'copy_field' ,
 'veh_loading_unloading_str'=> 'copy_field' ,
 'veh_marble_blocks_str'=> 'copy_field' ,
 'veh_passenger_transportation_str'=> 'copy_field' ,
 'veh_product_sector_str'=> 'copy_field' ,
 'veh_purchase_date_year_num'=> 'copy_field' ,
 'veh_purchase_date_month_str'=> 'copy_field' ,
 'veh_purchase_date_day_str'=> 'copy_field' ,
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
 'pol_RCA_premium_id_str'=> 'copy_field' ,
 'pol_kasko_minimum_uncoverage'=> 'copy_field' ,
 'pol_natural_events_act_of_vandalism'=> 'copy_field' ,
 'pol_social_political_and_natural_events'=> 'copy_field' 


      }

end

#  def build_hash_regexp_sect_1_prov_12()  a regime i provider si chiameranno prov_1, prov_2 etc
def build_hash_regexp_sect_1_tower()
#     target_values["fname_fvalue"]

    @rule_values = Hash.new

    @rule_values ={}

    @rule_values = { 'driv_job_str'  => "job=profilefield[:driv_job_str];  regexpi_mod_array = job.split(\" \"); regexp_mod = \"regexpi:([A-Za-z0-9])*\";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + \"(\" + el.to_s + \".*)+(\\s)*\" end;regexp_mod = regexp_mod + \"\\b\";" ,
       'veh_make_str'  => "make=profilefield[:veh_make_str];  regexpi_mod_array = make.split(\" \"); regexp_mod = \"regexpi:([A-Za-z0-9])*\";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + \"(\" + el.to_s + \".*)+(\\s)*\" end;regexp_mod = regexp_mod + \"\\b\";",
       'veh_set_up_str'  => "make=profilefield[:veh_set_up_str];  regexpi_mod_array = make.split(\" \"); regexp_mod = \"regexpi:([A-Za-z0-9])*\";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + \"(\" + el.to_s + \".*)+(\\s)*\" end;regexp_mod = regexp_mod + \"\\b\";",
       'veh_model_str'  => "make=profilefield[:veh_model_str];  regexpi_mod_array = make.split(\" \"); regexp_mod = \"regexpi:([A-Za-z0-9])*\";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + \"(\" + el.to_s + \".*)+(\\s)*\" end;regexp_mod = regexp_mod + \"\\b\";"
      }


































#  costruisci hash ["field_name + field_value","target"]
  end

end
