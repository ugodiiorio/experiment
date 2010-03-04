module Provider2Generali

def build_hash_sect_3()

    @rule_values ={}

    @rule_values = {

      'own_owner_sex_str' => 'translate_field',
      'pol_bersani_str' => 'translate_field',
      'pol_client_type_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_residence_province_str' => 'translate_field',
      'veh_fuel_str' => 'translate_field',
      'veh_vehicle_use_str' => 'translate_field',

      'pol_residence_str' => 'copy_field',
      'veh_capacity_num' => 'copy_field',

      'own_owner_birth_date_str' => 'data=Date.parse(profilefield[:pol_birth_date_str]);european_date = "%d%m%Y";data = data.strftime(european_date).to_s',
      'pol_matriculation_date_str' => 'data=Date.parse(profilefield[:pol_matriculation_date_str]);european_date = "%d%m%Y";data = data.strftime(european_date).to_s',
      'pol_policy_starting_date_str' => 'data=Date.parse(profilefield[:pol_policy_starting_date_str]);european_date = "%d%m%Y";data = data.strftime(european_date).to_s',
      'veh_vehicle_type_str' => '(profilefield[:veh_passenger_transportation_str]== "si") ? "Ciclomotore posto unico" : "Ciclomotore 2 posti"',

      'pol_premium_id_str' => '//*[@id="TOTALE_PI"]'
    }

end

end
