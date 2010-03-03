module Provider2FonSai

def build_hash_sect_3()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_bersani_str' => 'translate_field',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_coming_from_BM_num' => 'translate_field',
      'pol_coming_from_familiar_risk_certificate_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_property_type_to_be_insured_str' => 'translate_field',
      'pol_public_liability_exemption_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'veh_passenger_transportation_str' => 'translate_field',
      'veh_vehicle_type_str' => 'translate_field',
      'veh_vehicle_use_str' => 'translate_field',

      'own_owner_zip_code_str' => 'copy_field',

      'own_owner_birth_date_str' => 'Date.parse(infield[:pol_birth_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s.gsub("/","")',
      'pol_policy_starting_date_str' => 'Date.parse(infield[:pol_birth_date_str]);european_date = "%d/%m/%Y";data = data.strftime(european_date).to_s.gsub("/","")',

      'pol_premium_id_str' => '//*[@id="premio"]'
  }

end

end