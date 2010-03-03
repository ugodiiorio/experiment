#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module

class BuildDriverSchema
  
  def initialize(db_host, db_user, db_pwd, db_default_driver)
    @db_host = db_host
    @db_user = db_user
    @db_pwd = db_pwd
    @db_default_driver = db_default_driver
  end

	def run()
		
		puts "\nLa attivita' di creazione tabelle dello schema driver su host: "+ @db_host +" e' stata inizializzata..."
		
		mysql = Mysql.init()
#		mysql = Mysql.real_connect(@db_host, @db_user, @db_pwd, @db_default_driver)
    mysql = Mysql.real_connect(@db_host, @db_user, @db_pwd)

    mysql.query("CREATE SCHEMA IF NOT EXISTS " + @db_default_driver + "
		;")

#		c = Table_creator_traduttori.new()
#		c.Table_creator()
		
		mysql.query("CREATE TABLE " + @db_default_driver + ".profiles_personal_data (
			key_profiles_id_num 	INT UNSIGNED NOT NULL,
      pers_sex_str	VARCHAR(128),
			pers_name_str					VARCHAR(64) NOT NULL,
			pers_surname_str		VARCHAR(64) NOT NULL,
			pers_birth_place_str 			VARCHAR(128),
			pers_address_street_str			VARCHAR(128),
			pers_address_num_num			INT(2),
			pers_phone_type_str			VARCHAR(128),
			pers_mobile_prefix_num			INT(3),
			pers_mobile_number_num			VARCHAR(128),
			pers_e_mail_str 					VARCHAR(128),
			pers_toponym_str			VARCHAR(128),
      pers_education_str			VARCHAR(128),
      pers_vat_number_str VARCHAR(128),
      pers_denomination_company_str  VARCHAR(64),
      PRIMARY KEY (key_profiles_id_num)
      )
		;")

    mysql.query("  CREATE  INDEX sex_index   ON " + @db_default_driver + ".profiles_personal_data(pers_sex_str)
		;")

			mysql.query("CREATE TABLE " + @db_default_driver + ".insurance_profiles (
key_insurance_profiles_id_num INT UNSIGNED NOT NULL,
key_provider_id_str  VARCHAR(32)  NOT NULL,
key_sector_id_str  VARCHAR(32)  NOT NULL,
key_companies_group_id_str  VARCHAR(32)  NOT NULL,
key_working_set_id_str  VARCHAR(32)  NOT NULL,
pol_record_id_str  VARCHAR(32),
driv_birth_place_str     VARCHAR(128),
driv_birth_province_str     VARCHAR(128),
driv_birth_state_str     VARCHAR(128),
driv_citizenship_str     VARCHAR(128),
driv_civil_status_str     VARCHAR(128),
driv_driver_sex_str     VARCHAR(128),
driv_driving_experience_str     VARCHAR(128),
driv_driving_license_month_of_issue_str     VARCHAR(16),
driv_driving_license_points_str     VARCHAR(128),
driv_driving_license_type_str     VARCHAR(128),
driv_driving_license_year_of_issue_str     VARCHAR(128),
driv_driving_license_yrs_str     VARCHAR(128),
driv_heir_str     VARCHAR(128),
driv_italian_residence_starting_yrs_num     INT(4),
driv_job_2_str     VARCHAR(256),
driv_job_str     VARCHAR(256),
driv_residence_same_as_home_address_str     VARCHAR(128),
driv_studies_str     VARCHAR(128),
own_owner_sex_str     VARCHAR(128),
own_owner_specification_str     VARCHAR(128),
own_owner_zip_code_str     VARCHAR(128),
pol_already_benefit_from_bersani_str     VARCHAR(128),
pol_bersani_policy_expiring_date_str     VARCHAR(16),
pol_bersani_ref_vehicle_insured_with_company_str     VARCHAR(128),
pol_bersani_ref_vehicle_number_plate_str     VARCHAR(128),
pol_bersani_str     VARCHAR(128),
pol_birth_date_day_str     VARCHAR(128),
pol_birth_date_month_str     VARCHAR(128),
pol_birth_date_str     VARCHAR(128),
pol_birth_date_year_num     INT(4),
pol_BM_assigned_str     VARCHAR(128),
pol_BM_in_risk_certificate_str     VARCHAR(128),
pol_BM_1_more_than_1_year_str  VARCHAR(128),
pol_BM_particular_cases_str     VARCHAR(128),
pol_car_already_insured_with_company_str     VARCHAR(128),
pol_claims_total_number_malus_str     VARCHAR(128),
pol_claims_total_number_str     VARCHAR(128),
pol_client_type_str     VARCHAR(128),
pol_cohabiting_children_str     VARCHAR(16),
pol_coming_from_BM_num     VARCHAR(16),
pol_coming_from_company_str     INT(4),
pol_current_policy_guarantee_str     VARCHAR(128),
pol_defined_drive_str     VARCHAR(128),
pol_driver_accident_indemnity_limit_str     VARCHAR(128),
pol_driver_is_owner_str     VARCHAR(128),
pol_driver_less_25_yrs_license_less_2_yrs_str     VARCHAR(128),
pol_driver_less_than_26_yrs_str     VARCHAR(128),
pol_driver_zip_code_str     VARCHAR(128),
pol_driving_license_suspension_str     VARCHAR(128),
pol_driving_license_withdrawal_indemnity_limit_str     VARCHAR(128),
pol_driving_type_str     VARCHAR(128),
pol_drunkenness_fine_str     VARCHAR(128),
pol_exclusive_drive_str     VARCHAR(128),
pol_family_car_num     VARCHAR(128),
pol_family_members_insured_with_company_str     VARCHAR(128),
pol_free_drive_str     VARCHAR(128),
pol_how_do_you_know_the_company_str     VARCHAR(128),
pol_instalment_str     VARCHAR(128),
pol_insurance_situation_str     VARCHAR(128),
pol_leasing_str     VARCHAR(128),
pol_matriculation_date_day_str     VARCHAR(16),
pol_matriculation_date_month_str     VARCHAR(16),
pol_matriculation_date_str     VARCHAR(16),
pol_matriculation_date_year_num     INT(4),
pol_motorcycle_driving_ability_str     VARCHAR(128),
pol_nr_of_paid_claims_1_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_2_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_3_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_4_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_5_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_this_yr_str     VARCHAR(128),
pol_nr_of_yrs_insured_in_the_last_5_yrs_str     VARCHAR(128),
pol_nr_of_yrs_without_claims_str     VARCHAR(128),
pol_number_of_NI_NA_yrs_during_5_yrs_str     VARCHAR(128),
pol_number_plate_type_str     VARCHAR(128),
pol_other_policies_with_company_str     VARCHAR(128),
pol_other_vehicle_use_str     VARCHAR(128),
pol_partner_garages_str     VARCHAR(128),
pol_passenger_str     VARCHAR(128),
pol_payment_str     VARCHAR(128),
pol_pejus_cu_str     VARCHAR(128),
pol_policy_starting_date_day_str     VARCHAR(16),
pol_policy_starting_date_month_str     VARCHAR(16),
pol_policy_starting_date_str     VARCHAR(16),
pol_policy_starting_date_year_num     INT(4),
pol_privacy_1_str     VARCHAR(128),
pol_privacy_2_str     VARCHAR(128),
pol_privacy_3_str     VARCHAR(128),
pol_property_type_to_be_insured_str     VARCHAR(128),
pol_public_liability_exemption_str     VARCHAR(128),
pol_public_liability_indemnity_limit_str     VARCHAR(128),
pol_public_liability_type_str     VARCHAR(128),
pol_public_liability_young_exemption_str     VARCHAR(128),
pol_quotation_str     VARCHAR(128),
pol_RCA_code_str     VARCHAR(128),
pol_RCA_on_off_str     VARCHAR(128),
pol_RCA_premium_id_str     VARCHAR(256),
pol_renounce_compensation_str     VARCHAR(128),
pol_residence_province_str     VARCHAR(128),
pol_residence_str     INT(4),
pol_risk_certificate_str     VARCHAR(128),
pol_second_driver_str     VARCHAR(128),
pol_subscriber_is_driver_str     VARCHAR(128),
pol_subscriber_is_holder_str     VARCHAR(128),
pol_subscriber_is_owner_str     VARCHAR(128),
pol_type_of_contract_str     VARCHAR(128),
pol_vehicle_continuous_use_no_of_mths_str     VARCHAR(128),
veh_abs_str     VARCHAR(128),
veh_accesories_value_str     VARCHAR(128),
veh_airbag_str     VARCHAR(128),
veh_alarm_str     VARCHAR(128),
veh_antiskid_str     VARCHAR(128),
veh_bersani_reference_vehicle_str     VARCHAR(128),
veh_capacity_num     INT(5),
veh_corrosive_oily_gas_liquid_transportation_str     VARCHAR(128),
veh_cv_num     INT(4),
veh_fuel_str     VARCHAR(128),
veh_full_load_total_weight_num     INT(4),
veh_gas_methane_supply_str     VARCHAR(128),
veh_gprs_str     VARCHAR(128),
veh_habitual_vehicle_use_str     VARCHAR(128),
veh_home_delivery_str     VARCHAR(128),
veh_hook_str     VARCHAR(128),
veh_inflammable_liquid_transportation_str     VARCHAR(128),
veh_km_per_yr_str     VARCHAR(128),
veh_kw_num     VARCHAR(128),
veh_liquid_fuel_transportation_str     VARCHAR(128),
veh_loading_unloading_str     VARCHAR(128),
veh_make_previous_vehicle_str     VARCHAR(256),
veh_make_str     VARCHAR(256),
veh_marble_blocks_str     VARCHAR(128),
veh_model_str     VARCHAR(256),
veh_modification_made_str     VARCHAR(128),
veh_new_used_vehicle_str     VARCHAR(128),
veh_num_of_owners_str     VARCHAR(128),
veh_passenger_transportation_str     VARCHAR(128),
veh_product_sector_str     VARCHAR(128),
veh_purchase_date_day_str     VARCHAR(16),
veh_purchase_date_month_str     VARCHAR(16),
veh_purchase_date_str     VARCHAR(16),
veh_purchase_date_year_num     INT(4),
veh_radioactive_substances_transportation_str     VARCHAR(128),
veh_rent_str     VARCHAR(128),
veh_rent_with_driver_str     VARCHAR(128),
veh_set_up_previous_vehicle_str     VARCHAR(256),
veh_set_up_str     VARCHAR(256),
veh_stabilizer_str     INT(4),
veh_third_party_str     VARCHAR(128),
veh_tow_hook_str     VARCHAR(128),
veh_toxic_gas_explosive_transportation_str     VARCHAR(128),
veh_transportation_of_dangerous_goods_A_str     VARCHAR(128),
veh_transportation_of_dangerous_goods_B_str     VARCHAR(128),
veh_transportation_type_str     VARCHAR(128),
veh_truck_tractor_weight_num     INT(4),
veh_use_for_shops_str     VARCHAR(128),
veh_vehicle_for_disabled_str     VARCHAR(128),
veh_vehicle_shelter_str     VARCHAR(128),
veh_vehicle_type_str     VARCHAR(128),
veh_vehicle_use_str     VARCHAR(128),
veh_vehicle_value_str     VARCHAR(128),
veh_weight_to_be_towed_num     INT(4),
pol_act_of_vandalism_code_str     VARCHAR(128),
pol_act_of_vandalism_minimum_uncoverage_str     VARCHAR(128),
pol_act_of_vandalism_on_off_str     VARCHAR(128),
pol_act_of_vandalism_premium_id_str     VARCHAR(256),
pol_act_of_vandalisme_web_id_str     VARCHAR(256),
pol_assistance_code_str     VARCHAR(128),
pol_assistance_on_off_str     VARCHAR(128),
pol_assistance_premium_id_str     VARCHAR(256),
pol_assistance_web_id_str     VARCHAR(256),
pol_athmospheric_events_code_str     VARCHAR(128),
pol_athmospheric_events_on_off_str     VARCHAR(128),
pol_athmospheric_events_premium_id_str     VARCHAR(256),
pol_athmospheric_events_web_id_str     VARCHAR(256),
pol_blukasko_code_str     VARCHAR(128),
pol_blukasko_on_off_str     VARCHAR(128),
pol_blukasko_premium_id_str     VARCHAR(256),
pol_blukasko_web_id_str     VARCHAR(256),
pol_contingency_protection_code_str     VARCHAR(128),
pol_contingency_protection_on_off_str     VARCHAR(128),
pol_contingency_protection_premium_id_str     VARCHAR(256),
pol_contingency_protection_web_id_str     VARCHAR(256),
pol_driver_accident_coverage_code_str     VARCHAR(128),
pol_driver_accident_coverage_on_off_str     VARCHAR(128),
pol_driver_accident_coverage_premium_id_str     VARCHAR(256),
pol_driver_accident_coverage_web_id_str     VARCHAR(256),
pol_driving_licence_withdrawal_guarantee_code_str     VARCHAR(128),
pol_driving_licence_withdrawal_guarantee_on_off_str     VARCHAR(128),
pol_driving_licence_withdrawal_guarantee_premium_id_str     VARCHAR(256),
pol_driving_licence_withdrawal_guarantee_web_id_str     VARCHAR(256),
pol_easy_driver_code_str     VARCHAR(128),
pol_easy_driver_on_off_str     VARCHAR(128),
pol_easy_driver_premium_id_str     VARCHAR(128),
pol_easy_driver_web_id_str     VARCHAR(256),
pol_glasses_code_str     VARCHAR(256),
pol_glasses_minimum_uncovered_str     VARCHAR(128),
pol_glasses_on_off_str     VARCHAR(128),
pol_glasses_premium_id_str     VARCHAR(256),
pol_glasses_web_id_str     VARCHAR(256),
pol_kasko_code_str     VARCHAR(128),
pol_kasko_minimum_uncoverage_str     VARCHAR(128),
pol_kasko_on_off_str     VARCHAR(128),
pol_kasko_premium_id_str     VARCHAR(256),
pol_kasko_web_id_str     VARCHAR(256),
pol_legal_assistance_code_str     VARCHAR(128),
pol_legal_assistance_on_off_str     VARCHAR(128),
pol_legal_assistance_premium_id_str     VARCHAR(256),
pol_legal_assistance_web_id_str     VARCHAR(256),
pol_minikasko_code_str     VARCHAR(128),
pol_minikasko_premium_id_str     VARCHAR(256),
pol_minikasko_web_id_str     VARCHAR(256),
pol_natural_events_act_of_vandalism_code_str     VARCHAR(128),
pol_natural_events_act_of_vandalism_minimum_uncoverage_str     VARCHAR(128),
pol_natural_events_act_of_vandalism_on_off_str     VARCHAR(128),
pol_natural_events_act_of_vandalism_premium_id_str     VARCHAR(256),
pol_natural_events_act_of_vandalism_web_id_str     VARCHAR(256),
pol_natural_events_code_str     VARCHAR(128),
pol_natural_events_on_off_str     VARCHAR(128),
pol_natural_events_premium_id_str     VARCHAR(256),
pol_natural_events_web_id_str     VARCHAR(256),
pol_road_assistance_code_str     VARCHAR(128),
pol_road_assistance_indemnity_limit_str     VARCHAR(128),
pol_road_assistance_on_off_str     VARCHAR(128),
pol_road_assistance_premium_id_str     VARCHAR(256),
pol_road_assistance_type_str     VARCHAR(128),
pol_road_assistance_web_id_str     VARCHAR(256),
pol_social_political_and_natural_events_code_str     VARCHAR(128),
pol_social_political_and_natural_events_on_off_str     VARCHAR(128),
pol_social_political_and_natural_events_premium_id_str     VARCHAR(256),
pol_social_political_and_natural_events_web_id_str     VARCHAR(256),
pol_social_political_events_code_str     VARCHAR(128),
pol_social_political_events_on_off_str     VARCHAR(128),
pol_social_political_events_premium_id_str     VARCHAR(256),
pol_social_political_events_web_id_str     VARCHAR(256),
pol_supplementary_coverage_code_str     VARCHAR(128),
pol_supplementary_coverage_on_off_str     VARCHAR(128),
pol_supplementary_coverage_premium_id_str     VARCHAR(256),
pol_supplementary_coverage_web_id_str     VARCHAR(256),
pol_theft_fire_coverage_code_str     VARCHAR(128),
pol_theft_fire_coverage_on_off_str     VARCHAR(128),
pol_theft_fire_coverage_premium_id_str     VARCHAR(256),
pol_theft_fire_coverage_web_id_str     VARCHAR(256),
pol_theft_fire_minimum_uncoverage_exemption_str     VARCHAR(256),
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (key_insurance_profiles_id_num, key_provider_id_str, key_sector_id_str, key_companies_group_id_str, key_working_set_id_str)
)
;")


#pol_nr_of_persons_claims_1_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_2_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_3_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_4_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_5_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_this_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_1_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_2_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_3_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_4_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_5_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_this_yr_str	VARCHAR(128),



    	mysql.query("CREATE TABLE " + @db_default_driver + ".company_insurance_profiles (
key_insurance_profiles_id_num INT UNSIGNED NOT NULL,
key_provider_id_str  VARCHAR(32)  NOT NULL,
key_sector_id_str  VARCHAR(32)  NOT NULL,
key_company_id_str  VARCHAR(32)  NOT NULL,
key_working_set_id_str  VARCHAR(32)  NOT NULL,
pol_record_id_str  VARCHAR(32),
driv_birth_place_str     VARCHAR(128),
driv_birth_province_str     VARCHAR(128),
driv_birth_state_str     VARCHAR(128),
driv_citizenship_str     VARCHAR(128),
driv_civil_status_str     VARCHAR(128),
driv_driver_sex_str     VARCHAR(128),
driv_driving_experience_str     VARCHAR(128),
driv_driving_license_month_of_issue_str     VARCHAR(16),
driv_driving_license_points_str     VARCHAR(128),
driv_driving_license_type_str     VARCHAR(128),
driv_driving_license_year_of_issue_str     VARCHAR(128),
driv_driving_license_yrs_str     VARCHAR(128),
driv_heir_str     VARCHAR(128),
driv_italian_residence_starting_yrs_num     INT(4),
driv_job_2_str     VARCHAR(256),
driv_job_str     VARCHAR(256),
driv_residence_same_as_home_address_str     VARCHAR(128),
driv_studies_str     VARCHAR(128),
own_owner_sex_str     VARCHAR(128),
own_owner_specification_str     VARCHAR(128),
own_owner_zip_code_str     VARCHAR(128),
pol_already_benefit_from_bersani_str     VARCHAR(128),
pol_bersani_policy_expiring_date_str     VARCHAR(16),
pol_bersani_ref_vehicle_insured_with_company_str     VARCHAR(128),
pol_bersani_ref_vehicle_number_plate_str     VARCHAR(128),
pol_bersani_str     VARCHAR(128),
pol_birth_date_day_str     VARCHAR(128),
pol_birth_date_month_str     VARCHAR(128),
pol_birth_date_str     VARCHAR(128),
pol_birth_date_year_num     INT(4),
pol_BM_assigned_str     VARCHAR(128),
pol_BM_in_risk_certificate_str     VARCHAR(128),
pol_BM_1_more_than_1_year_str  VARCHAR(128),
pol_BM_particular_cases_str     VARCHAR(128),
pol_car_already_insured_with_company_str     VARCHAR(128),
pol_claims_total_number_malus_str     VARCHAR(128),
pol_claims_total_number_str     VARCHAR(128),
pol_client_type_str     VARCHAR(16),
pol_cohabiting_children_str     VARCHAR(16),
pol_coming_from_BM_num     VARCHAR(16),
pol_coming_from_company_str     INT(4),
pol_current_policy_guarantee_str     VARCHAR(128),
pol_defined_drive_str     VARCHAR(128),
pol_driver_accident_indemnity_limit_str     VARCHAR(128),
pol_driver_is_owner_str     VARCHAR(128),
pol_driver_less_25_yrs_license_less_2_yrs_str     VARCHAR(128),
pol_driver_less_than_26_yrs_str     VARCHAR(128),
pol_driver_zip_code_str     VARCHAR(128),
pol_driving_license_suspension_str     VARCHAR(128),
pol_driving_license_withdrawal_indemnity_limit_str     VARCHAR(128),
pol_driving_type_str     VARCHAR(128),
pol_drunkenness_fine_str     VARCHAR(128),
pol_exclusive_drive_str     VARCHAR(128),
pol_family_car_num     VARCHAR(128),
pol_family_members_insured_with_company_str     VARCHAR(128),
pol_free_drive_str     VARCHAR(128),
pol_how_do_you_know_the_company_str     VARCHAR(128),
pol_instalment_str     VARCHAR(128),
pol_insurance_situation_str     VARCHAR(128),
pol_leasing_str     VARCHAR(128),
pol_matriculation_date_day_str     VARCHAR(16),
pol_matriculation_date_month_str     VARCHAR(16),
pol_matriculation_date_str     VARCHAR(16),
pol_matriculation_date_year_num     INT(4),
pol_motorcycle_driving_ability_str     VARCHAR(128),
pol_nr_of_paid_claims_1_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_2_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_3_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_4_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_5_yr_str     VARCHAR(128),
pol_nr_of_paid_claims_this_yr_str     VARCHAR(128),
pol_nr_of_yrs_insured_in_the_last_5_yrs_str     VARCHAR(128),
pol_nr_of_yrs_without_claims_str     VARCHAR(128),
pol_number_of_NI_NA_yrs_during_5_yrs_str     VARCHAR(128),
pol_number_plate_type_str     VARCHAR(128),
pol_other_policies_with_company_str     VARCHAR(128),
pol_other_vehicle_use_str     VARCHAR(128),
pol_partner_garages_str     VARCHAR(128),
pol_passenger_str     VARCHAR(128),
pol_payment_str     VARCHAR(128),
pol_pejus_cu_str     VARCHAR(128),
pol_policy_starting_date_day_str     VARCHAR(16),
pol_policy_starting_date_month_str     VARCHAR(16),
pol_policy_starting_date_str     VARCHAR(16),
pol_policy_starting_date_year_num     INT(4),
pol_privacy_1_str     VARCHAR(128),
pol_privacy_2_str     VARCHAR(128),
pol_privacy_3_str     VARCHAR(128),
pol_property_type_to_be_insured_str     VARCHAR(128),
pol_public_liability_exemption_str     VARCHAR(128),
pol_public_liability_indemnity_limit_str     VARCHAR(128),
pol_public_liability_type_str     VARCHAR(128),
pol_public_liability_young_exemption_str     VARCHAR(128),
pol_quotation_str     VARCHAR(128),
pol_RCA_code_str     VARCHAR(128),
pol_RCA_on_off_str     VARCHAR(128),
pol_RCA_premium_id_str     VARCHAR(256),
pol_renounce_compensation_str     VARCHAR(128),
pol_residence_province_str     VARCHAR(128),
pol_residence_str     INT(4),
pol_risk_certificate_str     VARCHAR(128),
pol_second_driver_str     VARCHAR(128),
pol_subscriber_is_driver_str     VARCHAR(128),
pol_subscriber_is_holder_str     VARCHAR(128),
pol_subscriber_is_owner_str     VARCHAR(128),
pol_type_of_contract_str     VARCHAR(128),
pol_vehicle_continuous_use_no_of_mths_str     VARCHAR(128),
veh_abs_str     VARCHAR(128),
veh_accesories_value_str     VARCHAR(128),
veh_airbag_str     VARCHAR(128),
veh_alarm_str     VARCHAR(128),
veh_antiskid_str     VARCHAR(128),
veh_bersani_reference_vehicle_str     VARCHAR(128),
veh_capacity_num     INT(5),
veh_corrosive_oily_gas_liquid_transportation_str     VARCHAR(128),
veh_cv_num     INT(4),
veh_fuel_str     VARCHAR(128),
veh_full_load_total_weight_num     INT(4),
veh_gas_methane_supply_str     VARCHAR(128),
veh_gprs_str     VARCHAR(128),
veh_habitual_vehicle_use_str     VARCHAR(128),
veh_home_delivery_str     VARCHAR(128),
veh_hook_str     VARCHAR(128),
veh_inflammable_liquid_transportation_str     VARCHAR(128),
veh_km_per_yr_str     VARCHAR(128),
veh_kw_num     VARCHAR(128),
veh_liquid_fuel_transportation_str     VARCHAR(128),
veh_loading_unloading_str     VARCHAR(128),
veh_make_previous_vehicle_str     VARCHAR(256),
veh_make_str     VARCHAR(256),
veh_marble_blocks_str     VARCHAR(128),
veh_model_str     VARCHAR(256),
veh_modification_made_str     VARCHAR(128),
veh_new_used_vehicle_str     VARCHAR(128),
veh_num_of_owners_str     VARCHAR(128),
veh_passenger_transportation_str     VARCHAR(128),
veh_product_sector_str     VARCHAR(128),
veh_purchase_date_day_str     VARCHAR(16),
veh_purchase_date_month_str     VARCHAR(16),
veh_purchase_date_str     VARCHAR(16),
veh_purchase_date_year_num     INT(4),
veh_radioactive_substances_transportation_str     VARCHAR(128),
veh_rent_str     VARCHAR(128),
veh_rent_with_driver_str     VARCHAR(128),
veh_set_up_previous_vehicle_str     VARCHAR(256),
veh_set_up_str     VARCHAR(256),
veh_stabilizer_str     INT(4),
veh_third_party_str     VARCHAR(128),
veh_tow_hook_str     VARCHAR(128),
veh_toxic_gas_explosive_transportation_str     VARCHAR(128),
veh_transportation_of_dangerous_goods_A_str     VARCHAR(128),
veh_transportation_of_dangerous_goods_B_str     VARCHAR(128),
veh_transportation_type_str     VARCHAR(128),
veh_truck_tractor_weight_num     INT(4),
veh_use_for_shops_str     VARCHAR(128),
veh_vehicle_for_disabled_str     VARCHAR(128),
veh_vehicle_shelter_str     VARCHAR(128),
veh_vehicle_type_str     VARCHAR(128),
veh_vehicle_use_str     VARCHAR(128),
veh_vehicle_value_str     VARCHAR(128),
veh_weight_to_be_towed_num     INT(4),
pol_act_of_vandalism_code_str     VARCHAR(128),
pol_act_of_vandalism_minimum_uncoverage_str     VARCHAR(128),
pol_act_of_vandalism_on_off_str     VARCHAR(128),
pol_act_of_vandalism_premium_id_str     VARCHAR(256),
pol_act_of_vandalisme_web_id_str     VARCHAR(256),
pol_assistance_code_str     VARCHAR(128),
pol_assistance_on_off_str     VARCHAR(128),
pol_assistance_premium_id_str     VARCHAR(256),
pol_assistance_web_id_str     VARCHAR(256),
pol_athmospheric_events_code_str     VARCHAR(128),
pol_athmospheric_events_on_off_str     VARCHAR(128),
pol_athmospheric_events_premium_id_str     VARCHAR(256),
pol_athmospheric_events_web_id_str     VARCHAR(256),
pol_blukasko_code_str     VARCHAR(128),
pol_blukasko_on_off_str     VARCHAR(128),
pol_blukasko_premium_id_str     VARCHAR(256),
pol_blukasko_web_id_str     VARCHAR(256),
pol_contingency_protection_code_str     VARCHAR(128),
pol_contingency_protection_on_off_str     VARCHAR(128),
pol_contingency_protection_premium_id_str     VARCHAR(256),
pol_contingency_protection_web_id_str     VARCHAR(256),
pol_driver_accident_coverage_code_str     VARCHAR(128),
pol_driver_accident_coverage_on_off_str     VARCHAR(128),
pol_driver_accident_coverage_premium_id_str     VARCHAR(256),
pol_driver_accident_coverage_web_id_str     VARCHAR(256),
pol_driving_licence_withdrawal_guarantee_code_str     VARCHAR(128),
pol_driving_licence_withdrawal_guarantee_on_off_str     VARCHAR(128),
pol_driving_licence_withdrawal_guarantee_premium_id_str     VARCHAR(256),
pol_driving_licence_withdrawal_guarantee_web_id_str     VARCHAR(256),
pol_easy_driver_code_str     VARCHAR(128),
pol_easy_driver_on_off_str     VARCHAR(128),
pol_easy_driver_premium_id_str     VARCHAR(128),
pol_easy_driver_web_id_str     VARCHAR(256),
pol_glasses_code_str     VARCHAR(256),
pol_glasses_minimum_uncovered_str     VARCHAR(128),
pol_glasses_on_off_str     VARCHAR(128),
pol_glasses_premium_id_str     VARCHAR(256),
pol_glasses_web_id_str     VARCHAR(256),
pol_kasko_code_str     VARCHAR(128),
pol_kasko_minimum_uncoverage_str     VARCHAR(128),
pol_kasko_on_off_str     VARCHAR(128),
pol_kasko_premium_id_str     VARCHAR(256),
pol_kasko_web_id_str     VARCHAR(256),
pol_legal_assistance_code_str     VARCHAR(128),
pol_legal_assistance_on_off_str     VARCHAR(128),
pol_legal_assistance_premium_id_str     VARCHAR(256),
pol_legal_assistance_web_id_str     VARCHAR(256),
pol_minikasko_code_str     VARCHAR(128),
pol_minikasko_premium_id_str     VARCHAR(256),
pol_minikasko_web_id_str     VARCHAR(256),
pol_natural_events_act_of_vandalism_code_str     VARCHAR(128),
pol_natural_events_act_of_vandalism_minimum_uncoverage_str     VARCHAR(128),
pol_natural_events_act_of_vandalism_on_off_str     VARCHAR(128),
pol_natural_events_act_of_vandalism_premium_id_str     VARCHAR(256),
pol_natural_events_act_of_vandalism_web_id_str     VARCHAR(256),
pol_natural_events_code_str     VARCHAR(128),
pol_natural_events_on_off_str     VARCHAR(128),
pol_natural_events_premium_id_str     VARCHAR(256),
pol_natural_events_web_id_str     VARCHAR(256),
pol_road_assistance_code_str     VARCHAR(128),
pol_road_assistance_indemnity_limit_str     VARCHAR(128),
pol_road_assistance_on_off_str     VARCHAR(128),
pol_road_assistance_premium_id_str     VARCHAR(256),
pol_road_assistance_type_str     VARCHAR(128),
pol_road_assistance_web_id_str     VARCHAR(256),
pol_social_political_and_natural_events_code_str     VARCHAR(128),
pol_social_political_and_natural_events_on_off_str     VARCHAR(128),
pol_social_political_and_natural_events_premium_id_str     VARCHAR(256),
pol_social_political_and_natural_events_web_id_str     VARCHAR(256),
pol_social_political_events_code_str     VARCHAR(128),
pol_social_political_events_on_off_str     VARCHAR(128),
pol_social_political_events_premium_id_str     VARCHAR(256),
pol_social_political_events_web_id_str     VARCHAR(256),
pol_supplementary_coverage_code_str     VARCHAR(128),
pol_supplementary_coverage_on_off_str     VARCHAR(128),
pol_supplementary_coverage_premium_id_str     VARCHAR(256),
pol_supplementary_coverage_web_id_str     VARCHAR(256),
pol_theft_fire_coverage_code_str     VARCHAR(128),
pol_theft_fire_coverage_on_off_str     VARCHAR(128),
pol_theft_fire_coverage_premium_id_str     VARCHAR(256),
pol_theft_fire_coverage_web_id_str     VARCHAR(256),
pol_theft_fire_minimum_uncoverage_exemption_str     VARCHAR(256),
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (key_insurance_profiles_id_num, key_provider_id_str,key_sector_id_str, key_company_id_str, key_working_set_id_str)
)
;")

##    altre garanzie

#pol_nr_of_goods_claims_1_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_2_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_3_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_4_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_5_yr_str	VARCHAR(128),
#pol_nr_of_goods_claims_this_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_1_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_2_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_3_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_4_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_5_yr_str	VARCHAR(128),
#pol_nr_of_persons_claims_this_yr_str	VARCHAR(128),






    mysql.query("CREATE TABLE " + @db_default_driver + ".field_mapping (
        key_provider_id_str 	VARCHAR(32)  NOT NULL,
        key_sector_id_str 	VARCHAR(32)  NOT NULL,
        key_output_field_str 	VARCHAR(256)  NOT NULL,  PRIMARY KEY (key_provider_id_str, key_sector_id_str, key_output_field_str),
        eval_str		TEXT
        )
			;")


    mysql.query("CREATE TABLE  " + @db_default_driver + ".translated_fields (
        key_provider_id_str 	VARCHAR(32)  NOT NULL,
        key_sector_id_str 	VARCHAR(32)  NOT NULL,
        key_company_id_str 	VARCHAR(32)  NOT NULL,
        key_field_name_str 	VARCHAR(256)  NOT NULL,
        key_field_value_str 	VARCHAR(256)  NOT NULL,  PRIMARY KEY (key_provider_id_str, key_sector_id_str, key_company_id_str, key_field_name_str, key_field_value_str),
				target_value_str		VARCHAR(256)
        )
			;")

    mysql.query("CREATE TABLE " + @db_default_driver + ".translation_rules (
        key_provider_id_str 	VARCHAR(32)  NOT NULL,
        key_sector_id_str 	VARCHAR(32)  NOT NULL,
        key_company_id_str 	VARCHAR(32)  NOT NULL,
        key_field_name_str 	VARCHAR(256)  NOT NULL,  PRIMARY KEY (key_provider_id_str, key_sector_id_str, key_company_id_str, key_field_name_str),
        rule_str TEXT
        )
			;")

     mysql.query("CREATE TABLE " + @db_default_driver + ".companies (
        key_companies_group_id_str 	VARCHAR(32)  NOT NULL,
        key_company_id_str 	VARCHAR(32)  NOT NULL, PRIMARY KEY (key_companies_group_id_str, key_company_id_str)
        )
			;")

     mysql.query("CREATE TABLE " + @db_default_driver + ".covers (
        key_cover_id_str 	VARCHAR(32)  NOT NULL, PRIMARY KEY (key_cover_id_str),
        pol_cover_dsc_str 	VARCHAR(32)  NOT NULL
        )
			;")


    mysql.query("CREATE TABLE " + @db_default_driver + ".provider_1_sect_1_input_file (
        pol_record_id_str   VARCHAR(32) NOT NULL,
        Profilo_tecnico VARCHAR(128) NOT NULL,
        contatore   VARCHAR(128) NOT NULL,
        coeff_tecnico   VARCHAR(128),
        veh_make_str   VARCHAR(128),
        pol_matriculation_date_str   VARCHAR(128),
        veh_model_str   VARCHAR(128),
        veh_set_up_str   VARCHAR(128),
        veh_fuel_str   VARCHAR(128),
        CV_fiscali   VARCHAR(128),
        cilindrata   VARCHAR(128),
        veh_kw_num   VARCHAR(128),
        veh_habitual_vehicle_use_str   VARCHAR(128),
        driv_driver_sex_str   VARCHAR(128),
        pol_residence_province_str   VARCHAR(128),
        UrbanRural   VARCHAR(128),
        pol_residence_str   VARCHAR(128),
        pol_driver_zip_code_str   VARCHAR(128),
        driv_citizenship_str   VARCHAR(128),
        driv_job_str   VARCHAR(128),
        pol_insurance_situation_str   VARCHAR(128),
        pol_bersani_str   VARCHAR(128),
        pol_BM_assigned_str   VARCHAR(128),
        pol_nr_of_yrs_insured_in_the_last_5_yrs_str   VARCHAR(128),
        pol_claims_total_number_str   VARCHAR(128),
        pol_nr_of_paid_claims_this_yr_str   VARCHAR(128),
        pol_driver_less_than_26_yrs_str   VARCHAR(128),
        pol_instalment_str   VARCHAR(128),
        pol_public_liability_indemnity_limit_str   VARCHAR(128)
         )
			;")


mysql.query("CREATE TABLE " + @db_default_driver + ".provider_2_sect_1_input_file (
        pol_record_id_str VARCHAR(32) NOT NULL,
        pol_policy_starting_date_str VARCHAR(128),
        veh_make_str VARCHAR(128),
        pol_matriculation_date_str VARCHAR(128),
        veh_gas_methane_supply_str VARCHAR(128),
        veh_kw_num VARCHAR(128),
        veh_model_str VARCHAR(128),
        veh_set_up_str VARCHAR(128),
        veh_abs_str VARCHAR(128),
        veh_airbag_str VARCHAR(128),
        pol_client_type_str VARCHAR(128),
        own_owner_sex_str VARCHAR(128),
        own_birth_date_str VARCHAR(128),
        pol_residence_province_str VARCHAR(128),
        own_owner_zip_code_str VARCHAR(128),
        pol_residence_str VARCHAR(128),
        driv_driving_license_yrs_str VARCHAR(128),
        driv_job_str VARCHAR(128),
        pol_driver_sex_str VARCHAR(128),
        pol_birth_date_str VARCHAR(128),
        pol_driver_residence_province_str VARCHAR(128),
        pol_driver_zip_code_str VARCHAR(128),
        driv_residence_str VARCHAR(128),
        pol_insurance_situation_str VARCHAR(128),
        pol_bersani_str VARCHAR(128),
        pol_driver_less_than_26_yrs_str VARCHAR(128),
        pol_quotation_str VARCHAR(128),
        pol_BM_assigned_str VARCHAR(128),
        pol_nr_of_paid_claims_this_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_1_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_2_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_3_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_4_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_5_yr_str VARCHAR(128),
        pol_claims_total_number_str VARCHAR(128),
        pol_driving_type_str VARCHAR(128),
        pol_public_liability_exemption_str VARCHAR(128),
        pol_public_liability_indemnity_limit_str VARCHAR(128)
       )
     ;")

    mysql.query("CREATE TABLE " + @db_default_driver + ".provider_2_sect_2_input_file (
        pol_record_id_str VARCHAR(32) NOT NULL,
        pol_policy_starting_date_str VARCHAR(128),
        veh_make_str VARCHAR(128),
        pol_matriculation_date_str VARCHAR(128),
        veh_capacity_num VARCHAR(128),
        veh_model_str VARCHAR(128),
        veh_set_up_str VARCHAR(128),
        veh_passenger_transportation_str VARCHAR(128),
        veh_max_capacity_ever_driven_str VARCHAR(128),
        veh_make_previous_vehicle_str VARCHAR(128),
        veh_max_make_previous_set_up_str VARCHAR(128),
        pol_client_type_str VARCHAR(128),
        own_owner_sex_str VARCHAR(128),
        own_birth_date_str VARCHAR(128),
        pol_residence_province_str VARCHAR(128),
        own_owner_zip_code_str VARCHAR(128),
        pol_residence_str VARCHAR(128),
        driv_driving_license_yrs_str VARCHAR(128),
        driv_driving_experience_str VARCHAR(128),
        driv_job_str VARCHAR(128),
        pol_driver_sex_str VARCHAR(128),
        pol_birth_date_str VARCHAR(128),
        pol_driver_residence_province_str VARCHAR(128),
        pol_driver_zip_code_str VARCHAR(128),
        driv_residence_str VARCHAR(128),
        pol_insurance_situation_str VARCHAR(128),
        pol_bersani_str VARCHAR(128),
        pol_driver_less_than_26_yrs_str VARCHAR(128),
        pol_quotation_str VARCHAR(128),
        pol_BM_assigned_str VARCHAR(128),
        pol_nr_of_paid_claims_this_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_1_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_2_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_3_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_4_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_5_yr_str VARCHAR(128),
        pol_claims_total_number_str VARCHAR(128),
        pol_driving_type_str VARCHAR(128),
        pol_public_liability_exemption_str VARCHAR(128),
        pol_public_liability_indemnity_limit_str VARCHAR(128)
       )
     ;")

    mysql.query("CREATE TABLE " + @db_default_driver + ".provider_2_sect_3_input_file (
        pol_record_id_str VARCHAR(32) NOT NULL,
        pol_policy_starting_date_str VARCHAR(128),
        veh_passenger_transportation_str VARCHAR(128),
        pol_client_type_str VARCHAR(128),
        own_owner_sex_str VARCHAR(128),
        own_birth_date_str VARCHAR(128),
        pol_residence_province_str VARCHAR(128),
        own_owner_zip_code_str VARCHAR(128),
        pol_residence_str VARCHAR(128),
        pol_driver_sex_str VARCHAR(128),
        pol_birth_date_str VARCHAR(128),
        pol_driver_residence_province_str VARCHAR(128),
        pol_driver_zip_code_str VARCHAR(128),
        driv_residence_str VARCHAR(128),
        pol_insurance_situation_str VARCHAR(128),
        pol_quotation_str VARCHAR(128),
        pol_BM_assigned_str VARCHAR(128),
        pol_nr_of_paid_claims_this_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_1_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_2_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_3_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_4_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_5_yr_str VARCHAR(128),
        pol_claims_total_number_str VARCHAR(128),
        pol_public_liability_exemption_str VARCHAR(128),
        pol_public_liability_indemnity_limit_str VARCHAR(128)
       )
     ;")

    mysql.query("CREATE TABLE " + @db_default_driver + ".provider_2_sect_4_input_file (
        pol_record_id_str VARCHAR(32) NOT NULL,
        pol_policy_starting_date_str VARCHAR(128),
        veh_third_party_str VARCHAR(128),
        pol_matriculation_date_str VARCHAR(128),
        veh_full_load_total_weight_num VARCHAR(128),
        own_owner_zip_code_str VARCHAR(128),
        pol_residence_province_str VARCHAR(128),
        pol_residence_str VARCHAR(128),
        pol_insurance_situation_str VARCHAR(128),
        pol_quotation_str VARCHAR(128),
        pol_BM_assigned_str VARCHAR(128),
        pol_nr_of_paid_claims_this_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_1_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_2_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_3_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_4_yr_str VARCHAR(128),
        pol_nr_of_paid_claims_5_yr_str VARCHAR(128),
        pol_claims_total_number_str VARCHAR(128),
        pol_public_liability_exemption_str VARCHAR(128),
        pol_public_liability_indemnity_limit_str VARCHAR(128)
       )
     ;")



		mysql.close()
		
    		puts "\n - " + @db_default_driver + " schema tables creation finished"
	
	end
	
end


