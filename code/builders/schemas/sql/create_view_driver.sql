CREATE OR REPLACE VIEW kte_driver.driver
AS
    SELECT
        key_insurance_profiles_id_num,
        key_provider_id_str,
        key_sector_id_str,
        key_company_id_str,
        key_working_set_id_str,
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
        driv_job_2_str,
        driv_job_str,
        driv_residence_same_as_home_address_str,
        driv_studies_str
    FROM
        kte_driver.company_insurance_profiles