module FieldMappingProvider2Sect3

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {
      'pol_record_id_str' => 'infield[:pol_record_id_str].strip.downcase',
      'pol_policy_starting_date_str' => 'infield[:pol_policy_starting_date_str].strip.downcase',
      'veh_passenger_transportation_str' => 'infield[:veh_passenger_transportation_str].strip.downcase',
      'pol_client_type_str' => 'infield[:pol_client_type_str].strip.downcase',
      'own_owner_sex_str' => 'infield[:own_owner_sex_str].strip.downcase',
      'own_birth_date_str' => 'infield[:own_birth_date_str].strip.downcase',
      'pol_residence_province_str' => 'infield[:pol_residence_province_str].strip.downcase',
      'own_owner_zip_code_str' => 'infield[:own_owner_zip_code_str].strip.downcase',
      'pol_residence_str' => 'infield[:pol_residence_str].strip.downcase',
      'pol_driver_sex_str' => 'infield[:pol_driver_sex_str].strip.downcase',
      'pol_birth_date_str' => 'infield[:pol_birth_date_str].strip.downcase',
      'pol_residence_province_str' => 'infield[:pol_residence_province_str].strip.downcase',
      'pol_driver_zip_code_str' => 'infield[:pol_driver_zip_code_str].strip.downcase',
      'driv_residence_str' => 'infield[:driv_residence_str].strip.downcase',
      'pol_insurance_situation_str' => 'infield[:pol_insurance_situation_str].strip.downcase',
      'pol_quotation_str' => 'infield[:pol_quotation_str].strip.downcase',
      'pol_BM_assigned_str' => 'infield[:pol_BM_assigned_str].strip.downcase',
      'pol_nr_of_paid_claims_this_yr_str' => 'infield[:pol_nr_of_paid_claims_this_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_1_yr_str' => 'infield[:pol_nr_of_paid_claims_1_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_2_yr_str' => 'infield[:pol_nr_of_paid_claims_2_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_3_yr_str' => 'infield[:pol_nr_of_paid_claims_3_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_4_yr_str' => 'infield[:pol_nr_of_paid_claims_4_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_5_yr_str' => 'infield[:pol_nr_of_paid_claims_5_yr_str].strip.downcase',
      'pol_claims_total_number_str' => 'infield[:pol_claims_total_number_str].strip.downcase',
      'pol_public_liability_exemption_str' => 'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' => 'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',

      'veh_gas_methane_supply_str' => "'no'",
      'veh_capacity_num' => "'50'",
      'pol_yrs_with_no_claims_in_RC_str' => "'4'",
      'driv_birth_place_str' => 'infield[:pol_residence_str].strip.upcase',
      'driv_heir_str' => "'no'",
      'pol_instalment_str' => '"annuale"',
      'veh_rent_str' => "'no'",
      'pol_property_type_to_be_insured_str' => "'ciclomotore'",
      'pol_type_of_contract_str' => "'nuova polizza'",
      'veh_vehicle_type_str' => "'ciclomotore'",
      'veh_vehicle_use_str' => "'privato'"
    }
  end

end