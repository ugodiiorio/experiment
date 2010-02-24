module FieldMappingProvider2Sect2

  def build_hash_field_rule()

    @field_rule_values = Hash.new

    @field_rule_values = {}

    @field_rule_values = {
      'pol_record_id_str' => 'infield[:pol_record_id_str].strip.downcase',
      'pol_policy_starting_date_str' => 'infield[:pol_policy_starting_date_str].strip.downcase',
      'veh_make_str' => 'a=infield[:veh_make_str].strip; b= a.gsub(/à/,"a" );c= b.gsub(/è/,"e" );d= c.gsub(/é/,"e" );e= d.gsub(/ì/,"i" );f= e.gsub(/ò/,"o" );g= f.gsub(/ù/,"u" ); h= g.gsub(/°/,"a" ); f= h.gsub(/ª/,"a" );',
      'pol_matriculation_date_str' => '(DateTime::now - infield[:pol_matriculation_date_str].to_i.years).strftime("%F")',
      'veh_capacity_num' => 'infield[:veh_capacity_num].strip.downcase',
      'veh_model_str' => 'a=infield[:veh_model_str].strip; b= a.gsub(/à/,"a" );c= b.gsub(/è/,"e" );d= c.gsub(/é/,"e" );e= d.gsub(/ì/,"i" );f= e.gsub(/ò/,"o" );g= f.gsub(/ù/,"u" ); h= g.gsub(/°/,"a" ); f= h.gsub(/ª/,"a" );',
      'veh_set_up_str' => 'a=infield[:veh_set_up_str].strip; b= a.gsub(/à/,"a" );c= b.gsub(/è/,"e" );d= c.gsub(/é/,"e" );e= d.gsub(/ì/,"i" );f= e.gsub(/ò/,"o" );g= f.gsub(/ù/,"u" ); h= g.gsub(/°/,"a" ); f= h.gsub(/ª/,"a" );',
      'veh_passenger_transportation_str' => 'infield[:veh_passenger_transportation_str].strip.downcase',
      'veh_max_capacity_ever_driven_num' => 'infield[:veh_max_capacity_ever_driven_num].strip.downcase',
      'veh_make_previous_vehicle_str' => 'a=infield[:veh_make_previous_vehicle_str].strip; b= a.gsub(/à/,"a" );c= b.gsub(/è/,"e" );d= c.gsub(/é/,"e" );e= d.gsub(/ì/,"i" );f= e.gsub(/ò/,"o" );g= f.gsub(/ù/,"u" ); h= g.gsub(/°/,"a" ); f= h.gsub(/ª/,"a" );',
      'veh_previous_set_up_str' => 'a=infield[:veh_previous_set_up_str].strip; b= a.gsub(/à/,"a" );c= b.gsub(/è/,"e" );d= c.gsub(/é/,"e" );e= d.gsub(/ì/,"i" );f= e.gsub(/ò/,"o" );g= f.gsub(/ù/,"u" ); h= g.gsub(/°/,"a" ); f= h.gsub(/ª/,"a" );',
      'pol_client_type_str' => 'infield[:pol_client_type_str].strip.downcase',
      'own_owner_sex_str' => 'infield[:own_owner_sex_str].strip.downcase',
      'own_birth_date_str' => 'infield[:own_birth_date_str].strip.downcase',
      'pol_residence_province_str' => 'infield[:pol_residence_province_str].strip.downcase',
      'own_owner_zip_code_str' => 'infield[:own_owner_zip_code_str].strip.downcase',
      'pol_residence_str' => 'infield[:pol_residence_str].strip.downcase',
      'driv_driving_license_yrs_str' => 'infield[:driv_driving_license_yrs_str].strip.downcase',
      'driv_driving_experience_str' => 'infield[:driv_driving_experience_str].strip.downcase',
      'driv_job_str' => 'infield[:driv_job_str].strip.downcase',
      'pol_driver_sex_str' => 'infield[:pol_driver_sex_str].strip.downcase',
      'pol_birth_date_str' => 'infield[:pol_birth_date_str].strip.downcase',
      'pol_driver_residence_province_str' => 'infield[:pol_driver_residence_province_str].strip.downcase',
      'pol_driver_zip_code_str' => 'infield[:pol_driver_zip_code_str].strip.downcase',
      'driv_residence_str' => 'infield[:driv_residence_str].strip.downcase',
      'pol_insurance_situation_str' => 'infield[:pol_insurance_situation_str].strip.downcase',
      'pol_bersani_str' => 'infield[:pol_bersani_str].strip.downcase',
      'pol_driver_less_than_26_yrs_str' => 'infield[:pol_driver_less_than_26_yrs_str].strip.downcase',
      'pol_quotation_str' => 'infield[:pol_quotation_str].strip.downcase',
      'pol_BM_assigned_str' => 'infield[:pol_BM_assigned_str].strip.downcase',
      'pol_nr_of_paid_claims_this_yr_str' => 'infield[:pol_nr_of_paid_claims_this_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_1_yr_str' => 'infield[:pol_nr_of_paid_claims_1_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_2_yr_str' => 'infield[:pol_nr_of_paid_claims_2_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_3_yr_str' => 'infield[:pol_nr_of_paid_claims_3_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_4_yr_str' => 'infield[:pol_nr_of_paid_claims_4_yr_str].strip.downcase',
      'pol_nr_of_paid_claims_5_yr_str' => 'infield[:pol_nr_of_paid_claims_5_yr_str].strip.downcase',
      'pol_claims_total_number_str' => 'infield[:pol_claims_total_number_str].strip.downcase',
      'pol_driving_type_str' => 'infield[:pol_driving_type_str].strip.downcase',
      'pol_public_liability_exemption_str' => 'infield[:pol_public_liability_exemption_str].strip.downcase',
      'pol_public_liability_indemnity_limit_str' => 'infield[:pol_public_liability_indemnity_limit_str].strip.downcase',

      'veh_alarm_str' => "'nessuno'",
      'driv_citizenship_str' => "'ITALIA'",
      'pol_coming_from_company_str' => "'Generali'",
      'pol_how_do_you_know_the_company_str' => "'passaparola'",
      'veh_home_delivery_str' => "'no'",
      'pol_subscriber_is_holder_str' => "'si'",
      'driv_heir_str' => "'no'",
      'veh_tow_hook_str' => "'no'",
      'pol_current_policy_guarantee_str' => "'nessuna'",
      'pol_already_benefit_from_bersani_str' => "'no'",
      'veh_km_per_yr_num' => "'15000'",
      'pol_leasing_str' => "'no'",
      'veh_modification_made_str' => "'no'",
      'pol_drunkenness_fine_str' => "'no'",
      'pol_vehicle_continuous_use_no_of_mths_str' => "'più di due anni'",
      'pol_car_policy_with_company_str' => "'no'",
      'driv_residence_same_as_home_address_str' => "'si'",
      'driv_driving_license_points_str' => "'20'",
      'driv_residence_same_as_home_address_str' => "'si'",
      'veh_vehicle_shelter_str' => "'box privato'",
      'pol_second_driver_str' => "'no'",
      'pol_driving_license_suspension_str' => "'no'",
      'driv_civil_status_str' => "'coniugato con figli'",
      'pol_property_type_to_be_insured_str' => "'motociclo'",
      'pol_type_of_contract_str' => "'nuova polizza'",
      'pol_driving_type_str' => "'libera'",
      'driv_driving_license_type_str' => "'A senza limiti'",
      'driv_studies_str' => "'diploma'",
      'veh_habitual_vehicle_use_str' => "'tempo libero/ casa - lavoro'",
      'veh_vehicle_use_str' => "'privato'",
      'pol_other_vehicle_use_str' => "'no'",
      'veh_vehicle_value_str' => "'5000'",
      'veh_registered_with_str' => "'1'",
      'pol_bersani_ref_vehicle_insured_with_company_str' => "'no'"
      }
  end

end