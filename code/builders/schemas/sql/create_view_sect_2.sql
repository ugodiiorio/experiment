CREATE OR REPLACE VIEW kte_driver.sector_2
AS
    SELECT
        key_insurance_profiles_id_num,
        key_provider_id_str,
        key_sector_id_str,
        key_company_id_str,
        key_working_set_id_str,
        pol_record_id_str,
        pol_RCA_code_str,
        pol_RCA_on_off_str,
        pol_RCA_premium_id_str,
        driv_birth_place_str,
        driv_birth_province_str,
        driv_birth_state_str,
        driv_citizenship_str,
        driv_civil_status_str,
        driv_driver_sex_str,
        driv_driving_experience_str,
        driv_driving_license_month_of_issue_str,
        driv_driving_license_points_str,
        driv_driving_license_type_str,
        driv_driving_license_year_of_issue_str,
        driv_driving_license_yrs_str,
        driv_heir_str,
        driv_italian_residence_starting_yrs_num,
        driv_job_str,
        driv_residence_same_as_home_address_str,
        driv_studies_str,
        own_owner_sex_str,
        own_owner_specification_str,
        own_owner_residence_province_str,
        own_owner_residence_str,
        own_owner_zip_code_str,
        pol_collision_code_str,
        pol_collision_on_off_str,
        pol_collision_premium_id_str,
        pol_collision_web_id_str,
        pol_protected_bonus_code_str,
        pol_protected_bonus_on_off_str,
        pol_protected_bonus_premium_id_str,
        pol_protected_bonus_web_id_str,
        pol_protection_24_code_str,
        pol_protection_24_on_off_str,
        pol_protection_24_premium_id_str,
        pol_protection_24_web_id_str,
        pol_act_of_vandalism_code_str,
        pol_act_of_vandalism_minimum_uncoverage_str,
        pol_act_of_vandalism_on_off_str,
        pol_act_of_vandalism_premium_id_str,
        pol_act_of_vandalisme_web_id_str,
        pol_already_benefit_from_bersani_str,
        pol_assistance_on_off_str,
        pol_assistance_premium_id_str,
        pol_assistance_web_id_str,
        pol_athmospheric_events_code_str,
        pol_athmospheric_events_on_off_str,
        pol_athmospheric_events_premium_id_str,
        pol_athmospheric_events_web_id_str,
        pol_bersani_policy_expiring_date_str,
        pol_bersani_ref_vehicle_insured_with_company_str,
        pol_bersani_ref_vehicle_number_plate_str,
        pol_bersani_str,
        pol_birth_date_str,
        pol_blukasko_code_str,
        pol_blukasko_on_off_str,
        pol_blukasko_premium_id_str,
        pol_blukasko_web_id_str,
        pol_BM_assigned_str,
        pol_BM_particular_cases_str,
        pol_car_already_insured_with_company_str,
        pol_claims_total_number_malus_str,
        pol_claims_total_number_str,
        pol_client_type_str,
        pol_cohabiting_children_str,
        pol_coming_from_BM_num,
        pol_coming_from_company_str,
        pol_contingency_protection_code_str,
        pol_contingency_protection_on_off_str,
        pol_contingency_protection_premium_id_str,
        pol_contingency_protection_web_id_str,
        pol_current_policy_guarantee_str,
        pol_defined_drive_str,
        pol_driver_accident_coverage_code_str,
        pol_driver_accident_coverage_on_off_str,
        pol_driver_accident_coverage_premium_id_str,
        pol_driver_accident_coverage_web_id_str,
        pol_driver_accident_indemnity_limit_str,
        pol_driver_is_owner_str,
        pol_driver_less_25_yrs_license_less_2_yrs_str,
        pol_driver_less_than_26_yrs_str,
        pol_driver_zip_code_str,
        pol_driving_licence_withdrawal_guarantee_code_str,
        pol_driving_licence_withdrawal_guarantee_on_off_str,
        pol_driving_licence_withdrawal_guarantee_premium_id_str,
        pol_driving_licence_withdrawal_guarantee_web_id_str,
        pol_driving_license_suspension_str,
        pol_driving_license_withdrawal_indemnity_limit_str,
        pol_driving_type_str,
        pol_drunkenness_fine_str,
        pol_easy_driver_code_str,
        pol_easy_driver_on_off_str,
        pol_easy_driver_premium_id_str,
        pol_easy_driver_web_id_str,
        pol_exclusive_drive_str,
        pol_family_car_num,
        pol_family_members_insured_with_company_str,
        pol_glasses_code_str,
        pol_glasses_minimum_uncovered_str,
        pol_glasses_on_off_str,
        pol_glasses_premium_id_str,
        pol_glasses_web_id_str,
        pol_how_do_you_know_the_company_str,
        pol_instalment_str,
        pol_insurance_situation_str,
        pol_kasko_code_str,
        pol_kasko_minimum_uncoverage_str,
        pol_kasko_on_off_str,
        pol_kasko_premium_id_str,
        pol_kasko_web_id_str,
        pol_leasing_str,
        pol_legal_assistance_code_str,
        pol_legal_assistance_on_off_str,
        pol_legal_assistance_premium_id_str,
        pol_legal_assistance_web_id_str,
        pol_matriculation_date_str,
        pol_minikasko_code_str,
        pol_minikasko_premium_id_str,
        pol_minikasko_web_id_str,
        pol_natural_events_act_of_vandalism_code_str,
        pol_natural_events_act_of_vandalism_minimum_uncoverage_str,
        pol_natural_events_act_of_vandalism_on_off_str,
        pol_natural_events_act_of_vandalism_premium_id_str,
        pol_natural_events_act_of_vandalism_web_id_str,
        pol_natural_events_code_str,
        pol_natural_events_on_off_str,
        pol_natural_events_premium_id_str,
        pol_natural_events_web_id_str,
        pol_nr_of_paid_claims_1_yr_str,
        pol_nr_of_paid_claims_2_yr_str,
        pol_nr_of_paid_claims_3_yr_str,
        pol_nr_of_paid_claims_4_yr_str,
        pol_nr_of_paid_claims_5_yr_str,
        pol_nr_of_paid_claims_this_yr_str,
        pol_nr_of_yrs_insured_in_the_last_5_yrs_str,
        pol_nr_of_yrs_without_claims_str,
        pol_number_of_NI_NA_yrs_during_5_yrs_str,
        pol_number_plate_type_str,
        pol_other_policies_with_company_str,
        pol_other_vehicle_use_str,
        pol_partner_garages_str,
        pol_payment_str,
        pol_policy_starting_date_str,
        pol_privacy_1_str,
        pol_privacy_2_str,
        pol_privacy_3_str,
        pol_property_type_to_be_insured_str,
        pol_public_liability_exemption_str,
        pol_public_liability_indemnity_limit_str,
        pol_public_liability_young_exemption_str,
        pol_quotation_str,
        pol_renounce_compensation_str,
        pol_residence_province_str,
        pol_residence_str,
        pol_risk_certificate_str,
        pol_road_assistance_code_str,
        pol_road_assistance_indemnity_limit_str,
        pol_road_assistance_on_off_str,
        pol_road_assistance_premium_id_str,
        pol_road_assistance_type_str,
        pol_road_assistance_web_id_str,
        pol_second_driver_str,
        pol_social_political_and_natural_events_code_str,
        pol_social_political_and_natural_events_on_off_str,
        pol_social_political_and_natural_events_premium_id_str,
        pol_social_political_and_natural_events_web_id_str,
        pol_social_political_events_code_str,
        pol_social_political_events_on_off_str,
        pol_social_political_events_premium_id_str,
        pol_social_political_events_web_id_str,
        pol_subscriber_is_driver_str,
        pol_subscriber_is_holder_str,
        pol_subscriber_is_owner_str,
        pol_supplementary_coverage_code_str,
        pol_supplementary_coverage_on_off_str,
        pol_supplementary_coverage_premium_id_str,
        pol_supplementary_coverage_web_id_str,
        pol_theft_fire_coverage_code_str,
        pol_theft_fire_coverage_on_off_str,
        pol_theft_fire_coverage_premium_id_str,
        pol_theft_fire_coverage_web_id_str,
        pol_theft_fire_minimum_uncoverage_exemption_str,
        pol_type_of_contract_str,
        veh_abs_str,
        veh_accesories_value_str,
        veh_vehicle_use_str,
        veh_vehicle_value_str veh_airbag_str,
        veh_alarm_str,
        veh_antiskid_str,
        veh_bersani_reference_vehicle_str,
        veh_capacity_num,
        veh_cv_num,
        veh_fuel_str,
        veh_gas_methane_supply_str,
        veh_gprs_str,
        veh_habitual_vehicle_use_str,
        veh_km_per_yr_str,
        veh_kw_num,
        veh_make_previous_vehicle_str,
        veh_make_str,
        veh_model_str,
        veh_modification_made_str,
        veh_new_used_vehicle_str,
        veh_num_of_owners_str,
        veh_passenger_transportation_str,
        veh_purchase_date_str,
        veh_set_up_previous_vehicle_str,
        veh_set_up_str,
        veh_vehicle_shelter_str,
        veh_vehicle_type_str
    FROM
        kte_driver.company_insurance_profiles
    WHERE
        key_sector_id_str='sect_2'