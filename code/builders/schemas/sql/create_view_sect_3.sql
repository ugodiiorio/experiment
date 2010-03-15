CREATE OR REPLACE VIEW kte_driver.sector_3 AS SELECT key_insurance_profiles_id_num, key_provider_id_str, key_sector_id_str, key_company_id_str, key_working_set_id_str,pol_record_id_str, pol_RCA_code_str, pol_RCA_on_off_str, pol_RCA_premium_id_str,driv_birth_place_str, driv_heir_str, own_owner_sex_str,own_owner_residence_province_str, own_owner_residence_str,  own_owner_zip_code_str, pol_bersani_str, pol_birth_date_str, pol_BM_assigned_str, pol_claims_total_number_malus_str, pol_claims_total_number_str, pol_client_type_str, pol_coming_from_BM_num, driv_driver_sex_str, pol_driver_zip_code_str, pol_instalment_str, pol_insurance_situation_str, pol_matriculation_date_str, pol_nr_of_paid_claims_1_yr_str, pol_nr_of_paid_claims_2_yr_str, pol_nr_of_paid_claims_3_yr_str, pol_nr_of_paid_claims_4_yr_str, pol_nr_of_paid_claims_5_yr_str, pol_nr_of_paid_claims_this_yr_str, pol_nr_of_yrs_without_claims_str, pol_policy_starting_date_str, pol_property_type_to_be_insured_str, pol_public_liability_exemption_str, pol_public_liability_indemnity_limit_str, pol_public_liability_young_exemption_str, pol_quotation_str, pol_residence_province_str, pol_residence_str, pol_risk_certificate_str, pol_subscriber_is_driver_str, pol_type_of_contract_str, veh_capacity_num, veh_fuel_str, veh_make_str, veh_passenger_transportation_str, veh_rent_str, veh_set_up_str, veh_vehicle_type_str, veh_vehicle_use_str FROM company_insurance_profiles where key_sector_id_str='sect_3'
