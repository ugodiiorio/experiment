CREATE OR REPLACE VIEW kte_driver.sect_3
AS
    SELECT
        key_insurance_profiles_id_num,
        key_provider_id_str,
        key_sector_id_str,
        key_company_id_str,
        key_working_set_id_str,
        driv_birth_place_str,
        driv_driver_sex_str,
        driv_heir_str,
        own_owner_sex_str,
        own_owner_zip_code_str,
        pol_birth_date_str,
        pol_BM_assigned_str,
        pol_client_type_str,
        pol_driver_zip_code_str,
        pol_instalment_str,
        pol_insurance_situation_str,
        pol_matriculation_date_str,
        pol_nr_of_goods_claims_1_yr_str,
        pol_nr_of_goods_claims_2_yr_str,
        pol_nr_of_goods_claims_3_yr_str,
        pol_nr_of_goods_claims_4_yr_str,
        pol_nr_of_goods_claims_5_yr_str,
        pol_nr_of_goods_claims_this_yr_str,
        pol_nr_of_paid_claims_1_yr_str,
        pol_nr_of_paid_claims_2_yr_str,
        pol_nr_of_paid_claims_3_yr_str,
        pol_nr_of_paid_claims_4_yr_str,
        pol_nr_of_paid_claims_5_yr_str,
        pol_nr_of_paid_claims_this_yr_str,
        pol_nr_of_persons_claims_1_yr_str,
        pol_nr_of_persons_claims_2_yr_str,
        pol_nr_of_persons_claims_3_yr_str,
        pol_nr_of_persons_claims_4_yr_str,
        pol_nr_of_persons_claims_5_yr_str,
        pol_nr_of_persons_claims_this_yr_str,
        pol_nr_of_yrs_without_claims_str,
        pol_policy_starting_date_str,
        pol_privacy_1_str,
        pol_property_type_to_be_insured_str,
        pol_public_liability_exemption_str,
        pol_public_liability_indemnity_limit_str,
        pol_quotation_str,
        pol_residence_str,
        pol_risk_certificate_str,
        pol_type_of_contract_str,
        veh_capacity_num,
        veh_passenger_transportation_str,
        veh_rent_str,
        veh_vehicle_type_str,
        veh_vehicle_use_str
    FROM
        company_insurance_profiles
    WHERE
        key_sector_id_str='sect_3'