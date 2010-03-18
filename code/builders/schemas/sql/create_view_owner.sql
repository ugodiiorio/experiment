CREATE OR REPLACE VIEW kte_driver.owner
AS
    SELECT
        key_insurance_profiles_id_num,
        key_provider_id_str,
        key_sector_id_str,
        key_company_id_str,
        key_working_set_id_str,
        own_owner_sex_str,
        own_owner_specification_str,
        own_owner_zip_code_str,
        own_owner_residence_province_str,
        own_owner_residence_str
    FROM
        kte_driver.company_insurance_profiles