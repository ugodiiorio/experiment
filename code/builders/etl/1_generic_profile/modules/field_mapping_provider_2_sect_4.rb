module FieldMappingProvider2Sect4

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {
      'pol_record_id_str' =>'infield[:pol_record_id_str].strip.downcase',
      'own_owner_zip_code_str' =>'infield[:own_owner_zip_code_str].strip.downcase',
      'pol_BM_assigned_str' =>'infield[:pol_BM_assigned_str].strip.downcase',
      'pol_claims_total_number_str' =>'infield[:pol_claims_total_number_str].strip.downcase',
      'pol_insurance_situation_str' => 'a=infield[:pol_insurance_situation_str].strip.downcase; b=a.gsub(/à /,"a"); c=b.gsub(/è/,"e"); d=c.gsub(/é/,"e"); e=d.gsub(/ì/,"i"); f= e.gsub(/ò/,"o"); g=f.gsub(/ù/,"u"); h=g.gsub(/°/,"a");',
      'pol_matriculation_date_str' => '(DateTime::now - infield[:pol_matriculation_date_str].to_i.years).strftime("%F")',
      'pol_nr_of_paid_claims_1_yr_str' =>'infield[:pol_nr_of_paid_claims_1_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_2_yr_str' =>'infield[:pol_nr_of_paid_claims_2_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_3_yr_str' =>'infield[:pol_nr_of_paid_claims_3_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_4_yr_str' =>'infield[:pol_nr_of_paid_claims_4_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_5_yr_str' =>'infield[:pol_nr_of_paid_claims_5_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_this_yr_str' =>'infield[:pol_nr_of_paid_claims_this_yr_str].strip.downcase',
      'pol_policy_starting_date_str' =>'infield[:pol_policy_starting_date_str].strip.downcase',
      'pol_public_liability_exemption_str' =>'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' =>'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',
      'pol_quotation_str' =>'infield[:pol_quotation_str].strip.downcase',
      'pol_residence_province_str' =>'infield[:pol_residence_province_str].strip.downcase',
      'pol_residence_str' =>'infield[:pol_residence_str].strip.downcase',
      'veh_full_load_total_weight_str' =>'infield[:veh_full_load_total_weight_str].strip.downcase',
      'veh_third_party_str' =>'infield[:veh_third_party_str].strip.downcase',

      'pol_instalment_str' => "'annuale'",
      'veh_gas_methane_supply_str' => "'diesel'",
      'pol_number_of_NI_NA_yrs_during_5_yrs_str' => "'0'",
      'veh_alarm_str' => "'nessuno'",
      'driv_birth_place_str' => 'infield[:pol_residence_str].strip.upcase',
      'driv_heir_str' => "'no'",
      'veh_rent_with_driver_str' => "'no'",
      'veh_rent_str' => "'no'",
      'veh_truck_tractor_weight_num' => "'coincide col peso totale'",
      'veh_weight_to_be_towed_num' => "'da decidere'",
      'veh_hook_str' => "'no'",
      'pol_renounce_compensation_str' => "'no'",
      'own_owner_sex_str' => "'C'",
      'veh_product_sector_str' => "'Pesca, piscicoltura e servizi connessi'",
      'pol_property_type_to_be_insured_str' => "'autocarro per trasporto pesone o cose'",
      'pol_type_of_contract_str' => "'nuova polizza'",
      'pol_number_plate_type_str' => "'definitiva'",
      'veh_vehicle_type_str' => "'autocarro per trasporto persone o cose'",
      'pol_client_type_str' => "'C'",
      'own_owner_specification_str' => "'C'",
      'veh_toxic_gas_explosive_transportation_str' => "'no'",
      'veh_liquid_fuel_transportation_str' => "'no'",
      'veh_corrosive_oily_gas_liquid_transportation_str' => "'no'",
      'veh_inflammable_liquid_transportation_str' => "'no'",
      'veh_marble_blocks_str' => "'no'",
      'veh_transportation_of_dangerous_goods_A_str' => "'no'",
      'veh_transportation_of_dangerous_goods_B_str' => "'no'",
      'veh_radioactive_substances_transportation_str' => "'no'",
      'veh_use_for_shops_str' => "'no'",
      'veh_vehicle_use_str' => "'privato'"

    }
  end

end