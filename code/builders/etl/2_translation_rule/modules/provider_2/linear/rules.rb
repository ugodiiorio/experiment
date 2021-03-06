module Provider2Linear

  def build_hash_sect_1()

    @rule_values ={}

    @rule_values = {

      'driv_birth_place_str' => 'copy_field',
      'driv_birth_province_str' => 'copy_field',
      'driv_birth_state_str' => 'copy_field',
      'driv_citizenship_str' => 'profilefield[:driv_citizenship_str] == "GRAN BRETAGNA" ? "REGNO UNITO" : copy_field',
      'driv_civil_status_str' => 'copy_field',
      'driv_driver_sex_str' => 'translate_field',
      'driv_driving_experience_str'=> 'copy_field',
      'driv_driving_license_month_of_issue_str' => 'x= (Chronic.parse(@setup_date) - profilefield[:driv_driving_license_yrs_str].to_i.years ).strftime("%-1m"); y="index=" + x',
      'driv_driving_license_points_str' => 'copy_field',
      'driv_driving_license_type_str' => 'copy_field',
      'driv_driving_license_year_of_issue_str' => 'x= (Chronic.parse(@setup_date) - profilefield[:driv_driving_license_yrs_str].to_i.years ).strftime("%Y")',
      'driv_driving_license_yrs_str' => 'copy_field',
      'driv_heir_str' => 'copy_field',
      'driv_italian_residence_starting_yrs_num' => 'copy_field',
      'driv_job_2_str' => 'copy_field',
      'driv_job_str' => 'job=profilefield[:driv_job_str]; jregexp_mod = "regexpi:([A-Za-z0-9])*(";jregexpi_mod_array = job.split("/"); jregexpi_mod_array.each do |el| ;el_array= el.split(" "); el_array.each do |el2|; el2.length < 3 ? nil : jregexp_mod = jregexp_mod + "(" + el2.to_s + ".*)|" end;end ;jregexp_mod = jregexp_mod + "(niente))\\\\b"',
      'driv_residence_same_as_home_address_str' => 'copy_field',
      'driv_studies_str' => 'copy_field',
      'own_owner_residence_province_str' =>  'translate_field',
      'own_owner_residence_str' =>  'copy_field',
      'own_owner_sex_str' => 'translate_field',
      'own_owner_specification_str' => 'copy_field',
      'own_owner_zip_code_str' => 'copy_field',
      'pol_act_of_vandalism_code_str' => 'copy_field',
      'pol_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_act_of_vandalism_on_off_str' => 'copy_field',
      'pol_act_of_vandalism_premium_id_str' => 'copy_field',
      'pol_act_of_vandalism_web_id_str' => 'copy_field',
      'pol_already_benefit_from_bersani_str' => 'copy_field',
      'pol_assistance_code_str' => 'copy_field',
      'pol_assistance_on_off_str' => 'copy_field',
      'pol_assistance_premium_id_str' => 'copy_field',
      'pol_assistance_web_id_str' => 'copy_field',
      'pol_athmospheric_events_code_str' => 'copy_field',
      'pol_athmospheric_events_on_off_str' => 'copy_field',
      'pol_athmospheric_events_premium_id_str' => 'copy_field',
      'pol_athmospheric_events_web_id_str' => 'copy_field',
      'pol_bersani_policy_expiring_date_str' => 'copy_field',
      'pol_bersani_ref_vehicle_insured_with_company_str'=> 'translate_field',
      'pol_bersani_ref_vehicle_number_plate_str' => 'copy_field',
      'pol_bersani_str' => 'copy_field',
      'pol_birth_date_day_str' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%-1d")',
      'pol_birth_date_month_str' => 'x=(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%-1m"); y= "index=" + x',
      'pol_birth_date_str' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d/%m/%Y")',
      'pol_birth_date_year_num' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%Y")',
      'pol_blukasko_code_str' => 'copy_field',
      'pol_blukasko_on_off_str' => 'copy_field',
      'pol_blukasko_premium_id_str' => 'copy_field',
      'pol_blukasko_web_id_str' => 'copy_field',
      'pol_BM_1_more_than_1_year_str'  => 'copy_field',
      'pol_BM_1_more_than_1_year_str' => 'copy_field',
      'pol_BM_assigned_str' => 'profilefield[:pol_bersani_str] == "no" ? translate_field : ( profilefield[:pol_BM_assigned_str].to_i == -1 ? "1" : translate_field)',
      'pol_BM_in_risk_certificate_str' => 'copy_field',
      'pol_BM_particular_cases_str' => 'copy_field',
      'pol_car_already_insured_with_company_str' => 'translate_field',
      'pol_claims_total_number_malus_str'=> 'copy_field',
      'pol_claims_total_number_str' => 'copy_field',
      'pol_client_type_str' => 'translate_field',
      'pol_cohabiting_children_str' => 'copy_field',
      'pol_collision_code_str' => 'copy_field',
      'pol_collision_on_off_str' => 'copy_field',
      'pol_collision_premium_id_str' => 'copy_field',
      'pol_collision_web_id_str' => 'copy_field',
      'pol_coming_from_BM_str' => 'copy_field',
      'pol_coming_from_company_str' => 'copy_field',
      'pol_contingency_protection_code_str' => 'copy_field',
      'pol_contingency_protection_on_off_str' => 'copy_field',
      'pol_contingency_protection_premium_id_str' => 'copy_field',
      'pol_contingency_protection_web_id_str' => 'copy_field',
      'pol_current_policy_guarantee_str' => 'copy_field',
      'pol_defined_drive_str' => 'copy_field',
      'pol_driver_accident_coverage_code_str' => 'copy_field',
      'pol_driver_accident_coverage_on_off_str' => 'copy_field',
      'pol_driver_accident_coverage_premium_id_str' => 'copy_field',
      'pol_driver_accident_coverage_web_id_str' => 'translate_field',
      'pol_driver_accident_indemnity_limit_str' => 'copy_field',
      'pol_driver_is_owner_str' => 'translate_field',
      'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'copy_field',
      'pol_driver_less_than_26_yrs_str' => 'translate_field',
      'pol_driver_zip_code_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_code_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_on_off_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_premium_id_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_web_id_str' => 'translate_field',
      'pol_driving_license_suspension_str' => 'copy_field',
      'pol_driving_license_withdrawal_indemnity_limit_str' => 'copy_field',
      'pol_driving_type_str' => 'copy_field',
      'pol_drunkenness_fine_str' => 'copy_field',
      'pol_easy_driver_code_str' => 'copy_field',
      'pol_easy_driver_on_off_str' => 'copy_field',
      'pol_easy_driver_premium_id_str' => 'copy_field',
      'pol_easy_driver_web_id_str' => 'copy_field',
      'pol_exclusive_drive_str' => 'copy_field',
      'pol_family_car_num' => 'copy_field',
      'pol_family_members_insured_with_company_str' => 'copy_field',
      'pol_first_claim_month_str' => 'copy_field',
      'pol_first_claim_year_str' => 'copy_field',
      'pol_free_drive_str' => 'copy_field',
      'pol_glasses_code_str' => 'copy_field',
      'pol_glasses_minimum_uncovered_str' => 'copy_field',
      'pol_glasses_on_off_str' => 'copy_field',
      'pol_glasses_premium_id_str' => 'copy_field',
      'pol_glasses_web_id_str' => 'copy_field',
      'pol_how_do_you_know_the_company_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'profilefield[:pol_bersani_str] == "no" ? translate_field : "Da assicurare secondo la legge Bersani"',
      'pol_kasko_code_str' => 'copy_field',
      'pol_kasko_minimum_uncoverage_str' => 'copy_field',
      'pol_kasko_on_off_str' => 'copy_field',
      'pol_kasko_premium_id_str' => 'copy_field',
      'pol_kasko_web_id_str' => 'copy_field',
      'pol_leasing_str' => 'translate_field',
      'pol_legal_assistance_code_str' => 'copy_field',
      'pol_legal_assistance_on_off_str' => 'copy_field',
      'pol_legal_assistance_premium_id_str' => 'copy_field',
      'pol_legal_assistance_web_id_str' => 'translate_field',
      'pol_matriculation_date_month_str' =>'profilefield[:pol_matriculation_date_str].length == 10 ? x= profilefield[:pol_matriculation_date_str].slice(3,2) : (profilefield[:pol_matriculation_date_str].to_i == 0 ? x = (Chronic.parse(@rate_date)).strftime("%m") : x="01"); y= "index=" + x;',
      'pol_matriculation_date_year_num' => 'profilefield[:pol_matriculation_date_str].length > 2 ? profilefield[:pol_matriculation_date_str].slice(6,4) : (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%Y")',
      'pol_minikasko_code_str' => 'copy_field',
      'pol_minikasko_premium_id_str' => 'copy_field',
      'pol_minikasko_web_id_str' => 'translate_field',
      'pol_motorcycle_driving_ability_str'=> 'copy_field',
      'pol_natural_events_act_of_vandalism_code_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_on_off_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_premium_id_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_web_id_str' => 'copy_field',
      'pol_natural_events_code_str' => 'copy_field',
      'pol_natural_events_on_off_str' => 'copy_field',
      'pol_natural_events_premium_id_str' => 'copy_field',
      'pol_natural_events_web_id_str' => 'translate_field',
      'pol_nr_of_paid_claims_1_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_3_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_4_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_this_yr_str' => 'copy_field',
      'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => 'profilefield[:pol_nr_of_yrs_insured_in_the_last_5_yrs_str].to_i== 5 ? "Sì" : "No"',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'pol_number_of_NI_NA_yrs_during_5_yrs_str' => 'copy_field',
      'pol_number_plate_type_str' => 'copy_field',
      'pol_other_policies_with_company_str' => 'copy_field',
      'pol_other_vehicle_use_str' => 'copy_field',
      'pol_partner_garages_str' => 'copy_field',
      'pol_passenger_str'=> 'copy_field',
      'pol_payment_str' => 'copy_field',
      'pol_pejus_cu_str' => 'copy_field',
      'pol_policy_starting_date_day_str'=> 'copy_field',
      'pol_policy_starting_date_month_str'=> 'copy_field',
      'pol_policy_starting_date_str' => 'copy_field',
      'pol_policy_starting_date_year_num'=> 'copy_field',
      'pol_privacy_1_str' => 'copy_field',
      'pol_privacy_2_str' => 'copy_field',
      'pol_privacy_3_str' => 'copy_field',
      'pol_property_type_to_be_insured_str' => 'copy_field',
      'pol_protected_bonus_code_str' => 'copy_field',
      'pol_protected_bonus_on_off_str' => 'copy_field',
      'pol_protected_bonus_premium_id_str' => 'copy_field',
      'pol_protected_bonus_web_id_str' => 'translate_field',
      'pol_protection_24_code_str' => 'copy_field',
      'pol_protection_24_on_off_str' => 'copy_field',
      'pol_protection_24_premium_id_str' => 'copy_field',
      'pol_protection_24_web_id_str' => 'translate_field',
      'pol_public_liability_exemption_str' => 'copy_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_public_liability_type_str'=> 'copy_field',
      'pol_public_liability_young_exemption_str' => 'copy_field',
      'pol_quotation_str' => 'copy_field',
      'pol_RCA_code_str' =>  'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_record_id_str' => 'copy_field',
      'pol_renounce_compensation_str' => 'copy_field',
      'pol_residence_province_str' => 'translate_field',
      'pol_residence_str' => 'copy_field',
      'pol_risk_certificate_str' => 'translate_field',
      'pol_road_assistance_code_str' => 'copy_field',
      'pol_road_assistance_indemnity_limit_str' => 'copy_field',
      'pol_road_assistance_on_off_str' => 'copy_field',
      'pol_road_assistance_premium_id_str' => 'copy_field',
      'pol_road_assistance_type_str' => 'copy_field',
      'pol_road_assistance_web_id_str' => 'translate_field',
      'pol_second_claim_month_str' => 'copy_field',
      'pol_second_claim_year_str'  => 'copy_field',
      'pol_second_driver_str'=> 'copy_field',
      'pol_social_political_and_natural_events_code_str' => 'copy_field',
      'pol_social_political_and_natural_events_on_off_str' => 'copy_field',
      'pol_social_political_and_natural_events_premium_id_str' => 'copy_field',
      'pol_social_political_and_natural_events_web_id_str' => 'copy_field',
      'pol_social_political_events_code_str' => 'copy_field',
      'pol_social_political_events_on_off_str' => 'copy_field',
      'pol_social_political_events_premium_id_str' => 'copy_field',
      'pol_social_political_events_web_id_str' => 'translate_field',
      'pol_subscriber_is_driver_str' => 'copy_field',
      'pol_subscriber_is_holder_str'=> 'copy_field',
      'pol_subscriber_is_owner_str' => 'copy_field',
      'pol_supplementary_coverage_code_str' => 'copy_field',
      'pol_supplementary_coverage_on_off_str' => 'copy_field',
      'pol_supplementary_coverage_premium_id_str' => 'copy_field',
      'pol_supplementary_coverage_web_id_str' => 'copy_field',
      'pol_theft_fire_coverage_code_str'=> 'copy_field',
      'pol_theft_fire_coverage_on_off_str'=> 'copy_field',
      'pol_theft_fire_coverage_premium_id_str'=> 'copy_field',
      'pol_theft_fire_coverage_web_id_str'=> 'translate_field',
      'pol_theft_fire_minimum_uncoverage_exemption_str' => 'copy_field',
      'pol_type_of_contract_str' => 'copy_field',
      'pol_vehicle_continuous_use_no_of_mths_str'=> 'copy_field',
      'veh_abs_str' => 'copy_field',
      'veh_accesories_value_str' => 'copy_field',
      'veh_airbag_str' => 'copy_field',
      'veh_alarm_str' => 'translate_field',
      'veh_antiskid_str' => 'copy_field',
      'veh_bersani_reference_vehicle_str' => 'copy_field',
      'veh_capacity_num' => 'copy_field',
      'veh_corrosive_oily_gas_liquid_transportation_str'=> 'copy_field',
      'veh_cv_num'=> 'copy_field',
      'veh_fuel_str' => 'copy_field',
      'veh_full_load_total_weight_num'=> 'copy_field',
      'veh_gas_methane_supply_str' => 'translate_field',
      'veh_gprs_str' => 'copy_field',
      'veh_habitual_vehicle_use_str' => 'translate_field',
      'veh_home_delivery_str'=> 'copy_field',
      'veh_hook_str'=> 'copy_field',
      'veh_inflammable_liquid_transportation_str'=> 'copy_field',
      'veh_km_per_yr_str' => 'translate_field',
      'veh_kw_num' => 'copy_field',
      'veh_liquid_fuel_transportation_str'=> 'copy_field',
      'veh_loading_unloading_str'=> 'copy_field',
      'veh_make_previous_vehicle_str' => 'copy_field',
      'veh_make_str' => 'make=profilefield[:veh_make_str]; make= make.gsub(/---->/,"" ); make= make.gsub(/--->/,"" );make= make.gsub(/Â/,"" ); make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" ); make= make.gsub(/ª/,"a" ); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:^";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "$";',
      'veh_marble_blocks_str'=> 'copy_field',
      'veh_model_str' => 'make=profilefield[:veh_model_str]; make= make.gsub(/--->/,"" ); make= make.gsub(/\\((\\\\s)*\'[0-9]{2}(\\\\s)*-{0,1}(\\\\s)*(\')*[0-9]{0,2}(\\\\s)*\\)/,"" ); make= make.gsub(/Â/,"" ) ; make= make.gsub(/Polo 1ª-2ª\/Derby/i,"POLO" ); make= make.gsub(/A4 allroad/i,"A4" ); make= make.gsub(/Tigra TwinTop/i,"tigra" ); make= make.gsub(/punto evo/i,"punto" ); make= make.gsub(/terrano II/i,"terrano" );make= make.gsub(/Focus 2\\/Focus C-Max/i,"focus" ); make= make.gsub(/Combo\\/corsa.*/i,"combo" ); make= make.gsub(/grand vitara/i, "grand" );make= make.gsub(/Voy.\/G.Voyager/i, "grand voyager" );make= make.gsub(/V70\/XC70/,"V70" );  make= make.gsub(/\\([a-z0-9]+.*\\)/i, ""); make= make.gsub(/(serie)+(\\s)+([0-9][0-9])(^[0-9])/i,"\\\\3" );make= make.gsub(/(Vel Satis)/i,"Vel" ); make= make.gsub(/XF \\(X250\\)/,"XF" );make= make.gsub(/classe/i,"" ); make= make.gsub(/mégane\\/scénic/i,"MEGANE" );make= make.gsub(/\'96/,"" );make= make.gsub(/\\((\\\\s)*\'[0-9]{2}(\\\\s)*-{0,1}(\\\\s)*(\')*[0-9]{0,2}(\\\\s)*\\)/,"" );make= make.gsub(/rexton\/rexton/i,"rexton" );make= make.gsub(/X-Type X400\/6\/7\/8\/9/i,"X-Type" );make= make.gsub(/escort\/orion/i,"escort" );make= make.gsub(/\\(/,"\\\\(" ); make= make.gsub(/\\)/,"\\\\)" ); marca=profilefield[:veh_make_str]; all=profilefield[:veh_set_up_str]; if  (marca =~ /BMW/i && make =~ /serie.*/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0]; elsif (marca =~ /rover/i && make =~ /serie.*/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0] ; elsif (marca =~ /volvo/i && make =~ /serie.*/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0]; elsif (marca =~ /fiat/i && make =~ /bravo\/brava/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0] ; elsif (marca == "NISSAN" && make =~ /^z$/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0]  ; else make= make.gsub(/à/,"a" ); make= make.gsub(/classe/,"" );make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/---->/,"" );make= make.gsub(/--->/,"" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" );   make= make.gsub(/(\\s)+[0-9]+ª(\\s)+s.*/i, "");  make= make.gsub(/\\([0-9]+ª(\\s)+serie\\)/i, "");make= make.gsub(/(\\s)+[0-9]+ª-*/i, ""); make= make.gsub(/\([0-9]+\)/i, ""); make= make.strip; regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:^(" + make + ")+|regexpi:([A-Za-z0-9])*";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "$"; end ;',
      'veh_modification_made_str' => 'copy_field',
      'veh_new_used_vehicle_str' => 'copy_field',
      'veh_num_of_owners_str' => 'copy_field',
      'veh_passenger_transportation_str'=> 'copy_field',
      'veh_product_sector_str'=> 'copy_field',
      'veh_purchase_date_day_str' => 'copy_field',
      'veh_purchase_date_month_str' => 'copy_field',
      'veh_purchase_date_str' => 'copy_field',
      'veh_purchase_date_year_num' => 'copy_field',
      'veh_radioactive_substances_transportation_str'=> 'copy_field',
      'veh_rent_str'=> 'copy_field',
      'veh_rent_with_driver_str'=> 'copy_field',
      'veh_set_up_previous_vehicle_str' => 'copy_field',
      'veh_set_up_str' => 'marca=profilefield[:veh_make_str]; mod= profilefield[:veh_model_str]; mod= mod.gsub(/\\(/, ""); mod= mod.gsub(/\\)/, "");mod= mod.gsub(/V70\/XC70/,"V70" );mod= mod.gsub(/(Vel Satis)/i,"Vel" ); mod= mod.gsub(/XF \\(X250\\)/,"XF" );  make =profilefield[:veh_set_up_str]; make= make.gsub(/\\./,"\\\\." ); make= make.gsub(/porte/i,"p" ); make= make.gsub(/A4 allroad/i,"allroad" ); make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" ); make= make.gsub(/ª/,"a" ); make= make.gsub(/\\(/,"\\\\(" ); make= make.gsub(/\\)/,"\\\\)" ); mod_array = mod.split(" "); make_array = make.split(" ");regexp_mod = "regexpi:([A-Za-z0-9])*"; if marca == "BMW" ;make = make.gsub(make_array[0], ""); elsif (marca == "NISSAN" && mod = "Z"); make=make.gsub(make_array[0], "")  ; elsif (marca =~ /rover/i && mod =~ /serie/i); make=make.gsub(make_array[0], "")  ;else for i in (0..mod_array.size - 1) do mod_el = mod_array[i]; make =~ /#{mod_el}/i ? @make_new = make.gsub(/#{mod_el}\\b/, " ")   : @make_new = make;make = @make_new;i = i+1;end;end; regexp_mod = "regexpi:([A-Za-z0-9])*" ; regexpi_mod_array = make.split(" "); regexpi_mod_array.each do |el|; regexp_mod= regexp_mod + "(" + el + ".*)+(\\\\s)*"; end ; regexp_mod = regexp_mod + "|regexpi:([A-Za-z0-9])*"; regexpi_mod_array = make.split(" "); make.scan(/([0-9])+(\s)*(porte|pt|p(\.)*)+/i)[0].to_s == "" ? porte = "" : porte = "(?=.*(" + make.scan(/([0-9])+(\\s)*(porte|pt|p(\\.)*)+/i)[0].to_s + ".*)+)(\\\\s)*"; make = make.gsub(/([0-9])+(\\s)*(porte|pt|p(\\.)*)+/i, "");regexpi_mod_array = make.split(" ");regexpi_mod_array.each do |el|;if el =~ /([0-9]\\\\.[0-9])[a-z]{0,1}/i;( el = el.gsub(/([0-9]\\\\.[0-9])[a-z]{0,1}/, "\\\\1"); num = "(?=.*(" + el.to_s + ".*)+)(\\\\s)*" ; regexp_mod = regexp_mod + num;); elsif el =~ /([0-9]{1,3})(\\\\s)*(cv|v)/i; num = "(?=.*(" + el.to_s + ".*)+)(\\\\s)*" ; regexp_mod = regexp_mod + num; elsif el_array = el.scan(/\d+/); el_array  ? (el_array.each do |num|; num = "(?=.*(" + num.to_s + ".*)+)(\\\\s)*";regexp_mod = regexp_mod + num;end;el_array = el.scan(/\D+/);el_array.each do |char|;(char =~ /jt.*/i || char =~ /td.*/i || char =~ /cd.*/i || char =~ /sw|station|wagon/i )?char2 = "(?=.*(" + char.to_s + ".*)+)(\\\\s)*" : char2 = "(?=.*(" + char.to_s + ".*)*)(\\\\s)*";regexp_mod = regexp_mod + char2;end; ) : nil ;end; end;regexp_mod = regexp_mod + porte + "";',
      'veh_stabilizer_str' => 'copy_field',
      'veh_third_party_str'=> 'copy_field',
      'veh_tow_hook_str' => 'copy_field',
      'veh_toxic_gas_explosive_transportation_str'=> 'copy_field',
      'veh_transportation_of_dangerous_goods_A_str'=> 'copy_field',
      'veh_transportation_of_dangerous_goods_B_str'=> 'copy_field',
      'veh_transportation_type_str'=> 'copy_field',
      'veh_truck_tractor_weight_num'=> 'copy_field',
      'veh_use_for_shops_str'=> 'copy_field',
      'veh_vehicle_for_disabled_str' => 'copy_field',
      'veh_vehicle_shelter_str' => 'translate_field',
      'veh_vehicle_type_str' => 'copy_field',
      'veh_vehicle_use_str' => 'copy_field',
      'veh_vehicle_value_str' => 'copy_field',
      'veh_weight_to_be_towed_num'=> 'copy_field',

    }

  end

  def build_hash_sect_2()
 
    @rule_values = Hash.new

    @rule_values ={}

    @rule_values = {

      'driv_citizenship_str' => 'copy_field',
      'driv_driver_sex_str' => 'translate_field',
      'own_owner_residence_str' =>  'copy_field',
      'own_owner_sex_str' => 'translate_field',
      'own_owner_specification_str'  => 'copy_field',
      'pol_bersani_ref_vehicle_insured_with_company_str' => 'translate_field',
      'pol_bersani_ref_vehicle_number_plate_str' => 'copy_field',
      'pol_birth_date_day_str' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%-1d")',
      'pol_birth_date_month_str' => 'x=(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%-1m"); y= "index=" + x',
      'pol_birth_date_str' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d/%m/%Y")',
      'pol_birth_date_year_num' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%Y")',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_car_already_insured_with_company_str' => 'translate_field',
      'pol_claims_total_number_malus_str'=> 'copy_field',
      'pol_claims_total_number_str' => 'copy_field',
      'pol_client_type_str' => 'translate_field',
      'pol_contingency_protection_code_str' => 'copy_field',
      'pol_contingency_protection_on_off_str' => 'copy_field',
      'pol_contingency_protection_premium_id_str' => 'copy_field',
      'pol_contingency_protection_web_id_str' => 'copy_field',
      'pol_driver_accident_coverage_code_str' => 'copy_field',
      'pol_driver_accident_coverage_on_off_str' => 'copy_field',
      'pol_driver_accident_coverage_premium_id_str' => 'copy_field',
      'pol_driver_accident_coverage_web_id_str' => 'copy_field',
      'pol_driver_is_owner_str' => 'translate_field',
      'pol_driver_less_than_26_yrs_str' => 'translate_field',
      'pol_how_do_you_know_the_company_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'profilefield[:pol_bersani_str] == "no" ? translate_field : "Da assicurare secondo la legge Bersani"',
      'pol_leasing_str' => 'translate_field',
      'pol_legal_assistance_code_str' => 'copy_field',
      'pol_legal_assistance_on_off_str' => 'copy_field',
      'pol_legal_assistance_premium_id_str' => 'copy_field',
      'pol_legal_assistance_web_id_str' => 'translate_field',
      'pol_matriculation_date_month_str' =>'profilefield[:pol_matriculation_date_str].length == 10 ? x= profilefield[:pol_matriculation_date_str].slice(3,2) : (profilefield[:pol_matriculation_date_str].to_i == 0 ? x = (Chronic.parse(@rate_date)).strftime("%m") : x="01"); y= "index=" + x;',
      'pol_matriculation_date_year_num' => 'profilefield[:pol_matriculation_date_str].length > 2 ? profilefield[:pol_matriculation_date_str].slice(6,4) : (Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%Y")',
      'pol_nr_of_paid_claims_1_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_3_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_4_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_this_yr_str' => 'copy_field',
      'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => 'profilefield[:pol_nr_of_yrs_insured_in_the_last_5_yrs_str].to_i== 5 ? "Sì" : "No"',
      'pol_policy_starting_date_day_str'=> 'copy_field',
      'pol_policy_starting_date_month_str'=> 'copy_field',
      'pol_policy_starting_date_str' => 'copy_field',
      'pol_policy_starting_date_year_num'=> 'copy_field',
      'pol_property_type_to_be_insured_str'  => 'copy_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'pol_RCA_code_str' =>  'copy_field',
      'pol_RCA_on_off_str' => 'copy_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_record_id_str'  => 'copy_field',
      'pol_residence_str' => 'copy_field',
      'pol_road_assistance_code_str' => 'copy_field',
      'pol_road_assistance_on_off_str' => 'copy_field',
      'pol_road_assistance_premium_id_str' => 'copy_field',
      'pol_road_assistance_web_id_str' => 'translate_field',
      'veh_make_str' => 'make=profilefield[:veh_make_str];  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "\\\\b";',
      'veh_model_str' => 'make=profilefield[:veh_model_str]; marca=profilefield[:veh_make_str]; all=profilefield[:veh_set_up_str]; if  marca == "BIMBUMBAM" ; regexp_mod = "regexpi:^" + all.split(" ")[0] else make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" ); make= make.gsub(/[0-9]+ª(\\s)+s.*/i, ""); make= make.gsub(/[0-9]+ª-*/i, ""); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*";regexpi_mod_array.each do |el|; regexp_mod = regexp_mod + "(" + el.to_s + ".*)+(\\\\s)*" end;regexp_mod = regexp_mod + "$"; end',
      'veh_set_up_str' => 'make=profilefield[:veh_set_up_str];  regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:([A-Za-z0-9])*(\\\\s)*(?=.*?\\\\b" + regexpi_mod_array[0].to_s + "+" ; index=0 ;for index in (1..regexpi_mod_array.length-1);regexp_mod = regexp_mod + "((?=.*?\\\\b" + regexpi_mod_array[index].to_s + "\\\\b))*" end; regexp_mod = regexp_mod + ").+";',
      'veh_vehicle_shelter_str' => 'translate_field',
      'veh_vehicle_type_str'  => 'copy_field',
      'veh_vehicle_value_str' => 'copy_field',

    }

  end

end