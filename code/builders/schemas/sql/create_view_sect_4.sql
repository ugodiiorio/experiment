CREATE OR REPLACE VIEW kte_driver.sector_4 AS SELECT key_insurance_profiles_id_num, key_provider_id_str, key_sector_id_str, key_company_id_str, key_working_set_id_str,pol_record_id_str, pol_RCA_code_str, pol_RCA_on_off_str, pol_RCA_premium_id_str,own_owner_specification_str, own_owner_residence_province_str, own_owner_residence_str,  own_owner_zip_code_str, pol_renounce_compensation_str, pol_bersani_str, pol_BM_assigned_str, pol_BM_in_risk_certificate_str, pol_claims_total_number_malus_str, pol_claims_total_number_str, pol_client_type_str, pol_coming_from_BM_num, pol_driver_zip_code_str, pol_instalment_str, pol_insurance_situation_str, pol_matriculation_date_str, pol_nr_of_paid_claims_1_yr_str, pol_nr_of_paid_claims_2_yr_str, pol_nr_of_paid_claims_3_yr_str, pol_nr_of_paid_claims_4_yr_str, pol_nr_of_paid_claims_5_yr_str, pol_nr_of_paid_claims_this_yr_str, pol_number_plate_type_str, pol_pejus_cu_str, pol_policy_starting_date_str,  pol_property_type_to_be_insured_str, pol_public_liability_exemption_str, pol_public_liability_indemnity_limit_str, pol_quotation_str, pol_residence_province_str, pol_residence_str, pol_risk_certificate_str, pol_type_of_contract_str, veh_alarm_str, veh_corrosive_oily_gas_liquid_transportation_str, veh_fuel_str, veh_full_load_total_weight_num, veh_hook_str, veh_inflammable_liquid_transportation_str, veh_liquid_fuel_transportation_str, veh_loading_unloading_str, veh_marble_blocks_str, veh_product_sector_str, veh_radioactive_substances_transportation_str, veh_rent_str, veh_third_party_str, veh_toxic_gas_explosive_transportation_str, veh_transportation_of_dangerous_goods_A_str, veh_transportation_of_dangerous_goods_B_str, veh_transportation_type_str, veh_truck_tractor_weight_num, veh_use_for_shops_str, veh_vehicle_type_str, veh_vehicle_use_str, veh_weight_to_be_towed_num FROM company_insurance_profiles where key_sector_id_str='sect4'
