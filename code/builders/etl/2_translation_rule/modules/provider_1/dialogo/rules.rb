module Provider1Dialogo

  def build_hash_sect_1()

    @rule_values ={}

    @rule_values = {
      'pol_RCA_on_off_str' =>  'copy_field',
      'pol_RCA_code_str' =>  'copy_field',
      'pol_first_claim_month_str' => 'copy_field',
      'pol_first_claim_year_str' => 'copy_field',
      'pol_second_claim_month_str' => 'copy_field',
      'pol_second_claim_year_str'  => 'copy_field',
      'pol_BM_1_more_than_1_year_str' => 'copy_field',
      'pol_public_liability_young_exemption_str' => 'copy_field',
#      'pol_pejus_cu_str' => 'copy_field',
      'pol_BM_in_risk_certificate_str' => 'copy_field',
      'pol_minikasko_premium_id_str' => 'copy_field',
      'pol_minikasko_web_id_str' => 'copy_field',
      'pol_natural_events_code_str' => 'copy_field',
#      'veh_set_up_previous_vehicle_str' => 'copy_field',
#      'veh_make_previous_vehicle_str' => 'copy_field',
#      'pol_claims_total_number_malus_str'=> 'copy_field',
      'driv_driving_experience_str'=> 'copy_field',
      'veh_cv_num'=> '"0"',
      'driv_driving_license_month_of_issue_str' => 'copy_field',
      'driv_driver_sex_str' => 'translate_field',
      'pol_birth_date_day_str' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d")',
      'pol_birth_date_month_str' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%m")',
      'pol_birth_date_str' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d/%m/%Y")',
      'pol_birth_date_year_num' => '(Chronic.parse(@setup_date) - profilefield[:pol_birth_date_str].to_i.years).strftime("%d/%m/%Y")',
      'pol_BM_assigned_str' => 'translate_field',
      'pol_instalment_str' => 'translate_field',
      'pol_insurance_situation_str' => 'translate_field',
      'pol_legal_assistance_code_str' => 'copy_field',
      'pol_matriculation_date_day_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%d")',
      'pol_matriculation_date_month_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%m")',
      'pol_matriculation_date_str' => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%m/%Y")',
      'pol_matriculation_date_year_num' => '(Chronic.parse(@rate_date) - profilefield[:pol_matriculation_date_str].to_i.years).strftime("%Y")',
      'pol_policy_starting_date_str' => 'copy_field',
      'pol_RCA_premium_id_str' => 'translate_field',
      'pol_public_liability_indemnity_limit_str' => 'translate_field',
      'veh_km_per_yr_str' => 'copy_field',
      'veh_make_str' => 'make=profilefield[:veh_make_str]; make= make.gsub(/---->/,"" ); make= make.gsub(/--->/,"" );make= make.gsub(/Â/,"" ); make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" ); make= make.gsub(/ª/,"a" ); regexpi_mod_array = make.split(" "); regexp_mod = "regexpi:^(" + make + ")+"',
      'veh_model_str' => 'make=profilefield[:veh_model_str];make= make.gsub(/\\(\'([0-9]){2}(\\s)*(--->)\\)/,"" ); make= make.gsub(/\\([0-9]{4}--->\\)/,"" );make= make.gsub(/Polo 1ª-2ª\/Derby/i,"POLO" );make= make.gsub(/escort\/orion/i,"escort" ); make= make.gsub(/X-Type X400\/6\/7\/8\/9/i,"X-Type" );make= make.gsub(/XF \\(X250\\)/i,"XF" );make= make.gsub(/a4 allroad/i,"allroad" );make= make.gsub(/mégane\\/scénic/i,"MEGANE" );make= make.gsub(/punto evo/i,"punto" ); make= make.gsub(/pt cruiser/i,"pt" ); make= make.gsub(/rav4/i,"rav 4" ); make= make.gsub(/Tigra TwinTop/i,"tigra" ); make= make.gsub(/Focus 2\\/Focus C-Max/i,"focus" ); make= make.gsub(/Combo\\/corsa.*/i,"combo" ); make= make.gsub(/\'96/,"" );make= make.gsub(/\\((\\\\s)*\'[0-9]{2}(\\\\s)*-{0,1}(\\\\s)*(\')*[0-9]{0,2}(\\\\s)*\\)/,"" );make= make.gsub(/Voy.\/G.Voyager/i, "grand voyager" );make= make.gsub(/(grand vitara)(\\\\s)*(.*)/i, "\\\\1" );make= make.gsub(/Â/,"" ) ;  make= make.gsub(/\\(/,"\\\\(" ); make= make.gsub(/\\)/,"\\\\)" ); make= make.gsub(/(land cruiser 100)/i,"land cruiser" ); ;make= make.gsub(/megane\\/scenic/i,"megane" ); make= make.gsub(/(rexton\\/rexton II)/i,"rexton" ); make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" ); make= make.gsub(/V70\/XC70/,"XC70" );make= make.gsub(/Vitara\/Sidekick/,"vitara" ); make= make.gsub(/é/,"e" ); make= make.gsub(/ì/,"i" ); make= make.gsub(/ò/,"o" ); make= make.gsub(/ù/,"u" );make= make.gsub(/°/,"a" ); make= make.gsub(/[0-9]+ª(\\s)+s.*/i, "");make= make.gsub(/[0-9]+ª(\\s)+serie/i, "");make= make.gsub(/\\([0-9]+.*\\)/i, "");make= make.gsub(/ª/,"a" );marca=profilefield[:veh_make_str]; all=profilefield[:veh_set_up_str]; if ( marca =~ /BMW/i && make != "Z3") ; regexp_mod = "regexpi:^" + all.split(" ")[0]; elsif (marca == "ROVER" && make =~ /serie/i); regexp_mod = "regexpi:^" + all.split(" ")[0] ;  elsif (marca == "SMART" && make =~ /city coupe\/cabrio/i); regexp_mod = "regexpi:^" + all.split(" ")[0] ;  elsif (marca =~ /volvo/i && make =~ /serie.*/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0] ;elsif (marca =~ /fiat/i && make =~ /bravo\/brava/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0] ; elsif (marca == "MERCEDES" && make =~ /classe glk/i) ; regexp_mod = "regexpi:^" + all.split(" ")[1]; elsif (marca =~ /audi/i && make =~ /(a5\/s5\/cabrio)|(100\/200\/v8)|(80\/90\/cabrio)/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0]; elsif (marca == "MERCEDES" && make =~ /serie/i) ; regexp_mod = "regexpi:^(" + all.split(" ")[0] + " " + all.split(" ")[1]+")|regexpi:^(" + all.split(" ")[0] + ")";elsif (marca == "MERCEDES" && make =~ /classe/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0] + "|regexpi:^(" + all.split(" ")[0] + " " + all.split(" ")[1]+")"; elsif (marca == "NISSAN" && make =~ /^z$/i) ; regexp_mod = "regexpi:^" + all.split(" ")[0]  ; else  regexp_mod = "regexpi:^"; regexpi_mod_array = make.split("/"); regexpi_mod_array.each do |el|;regexpi_mod_array2 = el.split(" ");regexpi_mod_array2.each do |el2|;regexp_mod = regexp_mod + "(" + el2.to_s + ".*)+(\\\\s)*" end; end; regexp_mod = regexp_mod + "\\\\b" end;',
      'veh_vehicle_value_str' => 'copy_field',
#      14/04/2010 la seguente regexp è : parte 1 lasca ma no troppo, la seconda molto lasca. sempre con i kw fissi
#      'veh_set_up_str' => 'kw=profilefield[:veh_kw_num].to_s;make=profilefield[:veh_set_up_str]; make= make.gsub(/porte/,"PT" ); make= make.gsub(/turbodiesel/,"TD" );make= make.gsub(/weekend/,"WE" ); make= make.gsub(/raisin-top/,"R-TP" ); make= make.gsub(/twin spark/,"T-SK" ); make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" ); make= make.gsub(/ª/,"a" ); make= make.gsub(/tddi/i, "TD DI");  make= make.gsub(/tdci/i, "TD CI"); make= make.gsub(/5p./i, "5 PT");make= make.gsub(/3p./i, "3 PT");  make= make.gsub(/turbodiesel/i, "TD"); make= make.gsub(/\\(/,"\\\\(" ); make= make.gsub(/\\)/,"\\\\)" ); make= make.gsub(/\\./,"\\\\." ); regexpi_mod_array = make.split(" ");regexp_mod = "(([A-Za-z0-9])*";regexpi_mod_array.each do |el|;el_array = el.scan(/\d+/);el_array.each do |num|;num = "(?=.*(" + num.to_s + ".*)+)(\\\\s)*";regexp_mod = regexp_mod + num;end;el_array = el.scan(/\D+/);el_array.each do |char|;(char =~ /jt.*/i || char =~ /td.*/i || char =~ /cd.*/i || char =~ /sw|station|wagon/i )? char2 = "(?=.*(" + char.to_s + ".*)+)(\\\\s)*" : char2 = "(?=.*(" + char.to_s + ".*)+)(\\\\s)*";regexp_mod = regexp_mod + char2;end;end;regexp_mod = regexp_mod + ").+(([A-Za-z0-9])*" + kw + ".* kw)|";regexp_mod = regexp_mod +"(([A-Za-z0-9])*(\\\\s)*(?=.*?\\\\b(" + regexpi_mod_array[0].to_s + ")*\\\\b)*" ;index=0 ;for index in (1..regexpi_mod_array.length-1);regexp_mod = regexp_mod + "((?=.*?\\\\b" + regexpi_mod_array[index].to_s + "\\\\b))*" end;regexp_mod = regexp_mod + ").+(([A-Za-z0-9])*" + kw + ".* kw)";',
      'veh_set_up_str' => 'kw=profilefield[:veh_kw_num].to_s;make=profilefield[:veh_set_up_str];  make= make.gsub(/porte/,"PT" ); make= make.gsub(/turbodiesel/,"TD" );make= make.gsub(/weekend/,"WE" ); make= make.gsub(/raisin-top/,"R-TP" ); make= make.gsub(/twin spark/,"T-SK" ); make= make.gsub(/à/,"a" ); make= make.gsub(/è/,"e" );make= make.gsub(/é/,"e" );make= make.gsub(/ì/,"i" );make= make.gsub(/ò/,"o" );make= make.gsub(/ù/,"u" ); make= make.gsub(/°/,"a" ); make= make.gsub(/ª/,"a" ); make= make.gsub(/tddi/i, "TD DI");  make= make.gsub(/tdci/i, "TD CI"); make= make.gsub(/5p./i, "5 PT");make= make.gsub(/3p./i, "3 PT");  make= make.gsub(/turbodiesel/i, "TD"); make= make.gsub(/\\(/,"\\\\(" ); make= make.gsub(/\\)/,"\\\\)" ); make= make.gsub(/\\./,"\\\\." );regexp_mod = "regexpi:([A-Za-z0-9])*("; regexpi_mod_array = make.split(" "); make.scan(/([0-9])+(\s)*(porte|pt|p(\.)*)+/i)[0].to_s == "" ? porte = "" : porte = "(?=.*((" + make.scan(/([0-9])+(\\s)*(porte|pt|p(\\.)*)+/i)[0].to_s.gsub(/([0-9])+((\\s)*(porte|pt|p(\\.)*))+/i, "\\\\1") + ")+(\\\\s)*(p)*(pt)*)+)(\\\\s)*"; make2 = make.gsub(/([0-9])+(\\s)*(porte|pt|p(\\.)*)+/i, "");regexpi_mod_array = make2.split(" ");regexpi_mod_array.each do |el|;if el =~ /([0-9]\\\\.[0-9])[a-z]{0,1}/i;( el = el.gsub(/([0-9]\\\\.[0-9])[a-z]{0,1}/, "\\\\1"); num = "(?=.*(" + el.to_s + ".*)+)(\\\\s)*" ; regexp_mod = regexp_mod + num;); elsif el =~ /([0-9]{1,3})(\\\\s)*(cv|v)/i; num = "(?=.*(" + el.to_s + ".*)+)(\\\\s)*" ; regexp_mod = regexp_mod + num;  elsif el_array = el.scan(/\d+/); el_array  ? (el_array.each do |num|; num = "(?=.*(" + num.to_s + ".*)+)(\\\\s)*";regexp_mod = regexp_mod + num;end;el_array = el.scan(/\D+/);el_array.each do |char|;(char =~ /jt.*/i || char =~ /td.*/i || char =~ /cd.*/i || char =~ /sw|station|wagon|(s\\.w\\.)/i )?char2 = "(?=.*(" + char.to_s + ".*)+)(\\\\s)*" : char2 = "(?=.*(" + char.to_s + ".*)*)(\\\\s)*";regexp_mod = regexp_mod + char2;end; ) : nil ;end; end;regexp_mod = regexp_mod + porte + ").+(([A-Za-z0-9])*(\\\\s)*(" + kw + " kw))|";regexpi_mod_array = make.split(" ");regexp_mod = regexp_mod +"regexpi:(([A-Za-z0-9])*(\\\\s)*(?=.*?\\\\b(" + regexpi_mod_array[0].to_s + ")*\\\\b)*" ;index=0 ;for index in (1..regexpi_mod_array.length-1);regexp_mod = regexp_mod + "((?=.*?\\\\b" + regexpi_mod_array[index].to_s + "\\\\b))*" end;regexp_mod = regexp_mod + ").+(([A-Za-z0-9])*(\\\\s)*(" + kw + " kw))";',
#
#       regexp_mod = "regexpi:([A-Za-z0-9])*" ; regexpi_mod_array = make.split(" "); regexpi_mod_array.each do |el|; regexp_mod= regexp_mod + "(" + el + ".*)+(\\\\s)*"; end ; regexp_mod = regexp_mod + "|regexpi:([A-Za-z0-9])*"; regexpi_mod_array = make.split(" "); make.scan(/([0-9])+(\s)*(porte|pt|p(\.)*)+/i)[0].to_s == "" ? porte = "" : porte = "(?=.*(" + make.scan(/([0-9])+(\\s)*(porte|pt|p(\\.)*)+/i)[0].to_s + ".*)+)(\\\\s)*"; make = make.gsub(/([0-9])+(\\s)*(porte|pt|p(\\.)*)+/i, "");regexpi_mod_array = make.split(" ");regexpi_mod_array.each do |el|;if el =~ /([0-9]\\\\.[0-9])[a-z]{0,1}/i;( el = el.gsub(/([0-9]\\\\.[0-9])[a-z]{0,1}/, "\\\\1"); num = "(?=.*(" + el.to_s + ".*)+)(\\\\s)*" ; regexp_mod = regexp_mod + num;);   elsif el_array = el.scan(/\d+/); el_array  ? (el_array.each do |num|; num = "(?=.*(" + num.to_s + ".*)+)(\\\\s)*";regexp_mod = regexp_mod + num;end;el_array = el.scan(/\D+/);el_array.each do |char|;(char =~ /jt.*/i || char =~ /td.*/i || char =~ /cd.*/i || char =~ /sw|station|wagon/i )?char2 = "(?=.*(" + char.to_s + ".*)+)(\\\\s)*" : char2 = "(?=.*(" + char.to_s + ".*)*)(\\\\s)*";regexp_mod = regexp_mod + char2;end; ) : nil ;end; end;regexp_mod = regexp_mod + porte + "";',

#      'veh_set_up_str' => '"allestimento"',
      'driv_driving_license_yrs_str' =>'x = (profilefield[:driv_driving_license_yrs_str].to_i - 18).to_i; if x <= 1; y="meno di un anno"; elsif x <= 2; y="da uno a due anni"; elsif x <= 10; y="da due a dieci anni"; else  y="da oltre dieci anni" end;',
      'pol_how_do_you_know_the_company_str' => 'translate_field',
      'veh_vehicle_shelter_str' => 'translate_field',
      'own_owner_specification_str' => 'copy_field',
      'own_owner_residence_province_str' =>  'translate_field'   ,
       'driv_job_str' => 'job=profilefield[:driv_job_str]; spec=profilefield[:own_owner_specification_str] == "C" ? job = "impiegato" : job=job.gsub("militare", "forze dell\' ordine"); job=job.gsub("imprenditore / industriale", "libero professionista"); job=job.gsub("ingegnere", "libero professionista"); job=job.gsub("commerciante", "LAVORATORE INDIPENDENTE/AUTONOMO")  ; job=job.gsub("disoccupato", "senza occupazione")  ; job=job.gsub("avvocato", "libero professionista")  ; job=job.gsub("artigiano", "LAVORATORE INDIPENDENTE/AUTONOMO")  ; job=job.gsub("medico", "ALTRE PROFESSIONI"); job=job.gsub("studente", "ALTRE PROFESSIONI" ); job=job.gsub("ecclesiastico", "PERSONALE DEL CULTO" );job=job.gsub("architetto", "libero professionista" );jregexp_mod = "regexpi:([A-Za-z0-9])*(";jregexpi_mod_array = job.split("/"); jregexpi_mod_array.each do |el| ;el_array= el.split(" "); el_array.each do |el2|; el2.length < 3 ? nil : jregexp_mod = jregexp_mod + "(" + el2.to_s + ".*)|" end;end ;jregexp_mod = jregexp_mod + "(niente))\\\\b"', 'pol_bersani_str' => 'translate_field',
      'own_owner_residence_str' =>  'res=profilefield[:own_owner_residence_str].gsub("D A","D\'A").gsub("SULL ","SULL\'").gsub("SANT ","SANT\'").gsub("PIANORO VECCHIO","PIANORO").gsub("SEZZE SCALO","SEZZE").gsub("MASERA","MASERA\'").gsub("SANTA MARIA DELLE MOLE","MARINO").gsub("VILLANOVA CAMPOSAMPIERO","VILLANOVA DI CAMPOSAMPIERO").gsub("MANSUE","MANSUE\'").gsub("D\'ALME","D\'ALME\'").gsub("SAN NICOLO","SAN NICOLO\'").gsub("DOLCE","DOLCE\'").gsub("FOSSO","FOSSO\'").gsub("D EZZELINO","D\'EZZELINO").gsub("SANT ANNA","SANT\'ANNA").gsub("SANT A","SANT\'A").gsub("D ARCANO","D\'ARCANO").gsub("D ASTI","D\'ASTI").gsub("D ADDA","D\'ADDA").gsub("BRISSAGO VALTRAVAGLIA","BRISSAGO-VALTRAVAGLIA").gsub("D ESI","D\'ESI").gsub(" FABIASCO","-FABIASCO").gsub("DELL EMILIA","DELL\'EMILIA").gsub("SALORNO","SALORNO * SALURN").gsub("SANTA MARIA DELLE MOLE","MARINO").gsub("SANT\'ANSELME","SAINT ANSELME")',
      'pol_driver_accident_coverage_code_str' => 'copy_field',
      'pol_driver_zip_code_str' => 'res=profilefield[:pol_driver_zip_code_str]',
      'pol_subscriber_is_driver_str' => 'translate_field',
      'pol_subscriber_is_owner_str' => 'translate_field',
      'driv_citizenship_str' => 'state=profilefield[:driv_citizenship_str].gsub("CINA","CINA,REPUBBLICA POPOLARE").gsub("PERU","PERU\'").gsub("IUGOSLAVIA","JUGOSLAVIA")',
      'pol_glasses_code_str' => 'copy_field',
      'pol_theft_fire_minimum_uncoverage_exemption_str' => 'copy_field',
      'own_owner_sex_str' => 'translate_field',
      'pol_driver_is_owner_str' => 'translate_field',
      'pol_assistance_code_str' => 'copy_field',
      'veh_vehicle_use_str' => 'translate_field',
      'own_owner_zip_code_str' => 'res=profilefield[:own_owner_zip_code_str].gsub("16030","16031")',
      'pol_public_liability_exemption_str' => 'translate_field',
      'pol_nr_of_paid_claims_3_yr_str' => 'x= profilefield[:pol_nr_of_paid_claims_this_yr_str]; y= profilefield[:pol_nr_of_paid_claims_1_yr_str]; z= profilefield[:pol_nr_of_paid_claims_2_yr_str]; t= profilefield[:pol_nr_of_paid_claims_3_yr_str];  z == "N/A" ? sin= x.to_i+y.to_i+z.to_i : (t == "N/A" ? sin= x.to_i+y.to_i : sin= x.to_i+y.to_i+z.to_i+t.to_i); sin == 3 ? x = "3 o più" : x = sin.to_s',
      'pol_driving_type_str' => 'profilefield[:pol_birth_date_str].to_i < 26 ? "//input[@name=\"contentSubView:contentForm:chooseAuto:casoAss\" and @value=\"HNE\"]" : translate_field',
      'pol_number_plate_type_str' => 'translate_field',
      'veh_tow_hook_str' => 'translate_field',
      'veh_num_of_owners_str' => 'translate_field',
      'veh_alarm_str' => 'copy_field',
      'veh_habitual_vehicle_use_str' => 'copy_field',
      'pol_residence_str' => 'res=profilefield[:pol_residence_str].gsub("D A","D\'A").gsub("SULL ","SULL\'").gsub("SANT ","SANT\'").gsub("PIANORO VECCHIO","PIANORO").gsub("SEZZE SCALO","SEZZE").gsub("MASERA","MASERA\'").gsub("SANTA MARIA DELLE MOLE","MARINO").gsub("VILLANOVA CAMPOSAMPIERO","VILLANOVA DI CAMPOSAMPIERO").gsub("MANSUE","MANSUE\'").gsub("D\'ALME","D\'ALME\'").gsub("SAN NICOLO","SAN NICOLO\'").gsub("DOLCE","DOLCE\'").gsub("FOSSO","FOSSO\'").gsub("D EZZELINO","D\'EZZELINO").gsub("SANT ANNA","SANT\'ANNA").gsub("D ARCANO","D\'ARCANO").gsub("D ASTI","D\'ASTI").gsub("D ADDA","D\'ADDA").gsub("BRISSAGO VALTRAVAGLIA","BRISSAGO-VALTRAVAGLIA").gsub("D ESI","D\'ESI").gsub(" FABIASCO","-FABIASCO").gsub("DELL EMILIA","DELL\'EMILIA").gsub("SALORNO","SALORNO * SALURN").gsub("SANT\'ANSELME","SANT ANSELME")',
      'driv_birth_state_str' => 'state=profilefield[:driv_birth_state_str].gsub("CINA","CINA,REPUBBLICA POPOLARE").gsub("PERU","PERU\'").gsub("IUGOSLAVIA","JUGOSLAVIA")',
      'pol_minikasko_code_str' => 'copy_field',
      'driv_civil_status_str' => 'copy_field',
#      'veh_purchase_date_str' => 'copy_field',
#      'veh_purchase_date_year_num' => 'copy_field',
#      'veh_purchase_date_month_str' => 'copy_field',
#      'veh_purchase_date_day_str' => 'copy_field',
      'pol_residence_province_str' => 'translate_field',
      'pol_payment_str' => 'copy_field',
      'veh_fuel_str' => 'copy_field',
      'driv_birth_place_str' => 'res=profilefield[:driv_birth_place_str].gsub("D ALME","D\'ALME\'").gsub("SANT ","SANT\'").gsub("MANSUE","MANSUE\'").gsub("PIANORO VECCHIO","PIANORO").gsub("SANTA MARIA DELLE MOLE","MARINO").gsub("SAN NICOLO","SAN NICOLO\'").gsub("DOLCE","DOLCE\'").gsub("FOSSO","FOSSO\'").gsub("D EZZELINO","D\'EZZELINO").gsub("SANT ANNA","SANT\'ANNA").gsub("D ARCANO","D\'ARCANO").gsub("D ASTI","D\'ASTI").gsub("D ADDA","D\'ADDA").gsub("BRISSAGO VALTRAVAGLIA","BRISSAGO-VALTRAVAGLIA").gsub("D ESI","D\'ESI").gsub(" FABIASCO","-FABIASCO").gsub("DELL EMILIA","DELL\'EMILIA").gsub("SALORNO","SALORNO * SALURN").gsub("SANT\'ANSELME","SANT ANSELME")',
      'driv_birth_province_str' => 'translate_field',
      'driv_driving_license_points_str' => 'copy_field',
      'driv_driving_license_type_str' => 'copy_field',
      'driv_italian_residence_starting_yrs_num' => 'copy_field',
      'driv_residence_same_as_home_address_str' => 'copy_field',
      'pol_cohabiting_children_str' => 'copy_field',
      'pol_defined_drive_str' => 'copy_field',
#      'pol_driving_license_suspension_str' => 'copy_field',
#      'pol_drunkenness_fine_str' => 'copy_field',
      'pol_exclusive_drive_str' => 'copy_field',
      'pol_free_drive_str' => 'copy_field',
      'pol_other_vehicle_use_str' => 'copy_field',
      'pol_privacy_1_str' => 'copy_field',
      'pol_road_assistance_type_str' => 'copy_field',
#      'veh_modification_made_str' => 'copy_field',
#      'veh_new_used_vehicle_str' => 'copy_field',
      'pol_act_of_vandalism_on_off_str' => 'copy_field',
      'pol_kasko_code_str' => 'copy_field',
      'pol_driver_less_than_26_yrs_str' => 'copy_field',
      'pol_leasing_str' => 'copy_field',
      'pol_nr_of_paid_claims_1_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_5_yr_str' => 'copy_field',
      'veh_gas_methane_supply_str' => 'copy_field',
      'driv_driving_license_year_of_issue_str' => 'x = "" ; if (profilefield[:driv_driving_license_yrs_str].to_i - 18) < 1; x="meno di un anno"; elsif (profilefield[:driv_driving_license_yrs_str].to_i - 18) <= 2; x="da uno a due anni"; elsif (profilefield[:driv_driving_license_yrs_str].to_i - 18) <= 10; x="da due a dieci anni"; else  x="da oltre dieci anni" end;',
      'pol_athmospheric_events_code_str' => 'copy_field',
      'veh_accesories_value_str' => 'copy_field',
#      'pol_car_already_insured_with_company_str' => 'copy_field',
#      'pol_coming_from_BM_str' => 'copy_field',
#      'pol_family_car_num' => 'copy_field',
#      'pol_family_members_insured_with_company_str' => 'copy_field',
#      'pol_client_type_str' => 'copy_field',
#      'pol_coming_from_company_str' => 'copy_field',
#      'pol_glasses_minimum_uncovered_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_code_str' => 'copy_field',
      'pol_nr_of_paid_claims_2_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_4_yr_str' => 'copy_field',
      'pol_nr_of_paid_claims_this_yr_str' => 'copy_field',
#      'driv_heir_str' => 'copy_field',
#      'driv_studies_str' => 'copy_field',
#      'pol_already_benefit_from_bersani_str' => 'copy_field',
#      'pol_bersani_policy_expiring_date_str' => 'copy_field',
#      'pol_bersani_ref_vehicle_number_plate_str' => 'copy_field',
      'pol_blukasko_code_str' => 'copy_field',
      'pol_claims_total_number_str' => 'profilefield[:pol_claims_total_number_str].to_i == 0 ? copy_field : x= "1 o più"',
      'pol_contingency_protection_code_str' => 'copy_field',
      'pol_current_policy_guarantee_str' => 'copy_field',
      'pol_driver_less_25_yrs_license_less_2_yrs_str' => 'copy_field',
      'pol_driving_license_withdrawal_indemnity_limit_str' => 'copy_field',
      'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => 'copy_field',
      'pol_nr_of_yrs_without_claims_str' => 'copy_field',
      'pol_number_of_NI_NA_yrs_during_5_yrs_str' => 'copy_field',
#      'pol_partner_garages_str' => 'copy_field',
#      'pol_privacy_2_str' => 'copy_field',
#      'pol_privacy_3_str' => 'copy_field',
#      'pol_property_type_to_be_insured_str' => 'copy_field',
      'pol_quotation_str' => 'copy_field',
      'pol_renounce_compensation_str' => 'copy_field',
      'pol_risk_certificate_str' => 'copy_field',
      'pol_road_assistance_indemnity_limit_str' => 'copy_field',
      'pol_type_of_contract_str' => 'copy_field',
      'veh_abs_str' => 'copy_field',
      'veh_airbag_str' => 'copy_field',
#      'veh_antiskid_str' => 'copy_field',
#      'veh_bersani_reference_vehicle_str' => 'copy_field',
#      'veh_gprs_str' => 'copy_field',
      'veh_kw_num' => 'copy_field',
      'veh_capacity_num' => 'copy_field',
#      'veh_stabilizer_str' => 'copy_field',
#      'veh_vehicle_for_disabled_str' => 'copy_field',
#      'veh_vehicle_type_str' => 'copy_field',
#      'pol_other_policies_with_company_str' => 'copy_field',
#      'pol_BM_particular_cases_str' => 'copy_field',
      'pol_act_of_vandalism_minimum_uncoverage_str' => 'copy_field',
      'pol_act_of_vandalisme_web_id_str' => 'copy_field',
      'pol_act_of_vandalism_premium_id_str' => 'copy_field',
      'pol_assistance_on_off_str' => 'copy_field',
      'pol_assistance_web_id_str' => 'translate_field',
      'pol_assistance_premium_id_str' => 'copy_field',
      'pol_athmospheric_events_on_off_str' => 'copy_field',
      'pol_athmospheric_events_web_id_str' => 'copy_field',
      'pol_athmospheric_events_premium_id_str' => 'copy_field',
      'pol_blukasko_on_off_str' => 'copy_field',
      'pol_blukasko_web_id_str' => 'copy_field',
      'pol_blukasko_premium_id_str' => 'copy_field',
      'pol_contingency_protection_on_off_str' => 'copy_field',
      'pol_contingency_protection_web_id_str' => 'copy_field',
      'pol_contingency_protection_premium_id_str' => 'copy_field',
      'pol_driver_accident_coverage_on_off_str' => 'copy_field',
      'pol_driver_accident_coverage_web_id_str' => 'translate_field',
      'pol_driver_accident_coverage_premium_id_str' => 'copy_field',
      'pol_driver_accident_indemnity_limit_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_code_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_on_off_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_web_id_str' => 'copy_field',
      'pol_driving_licence_withdrawal_guarantee_premium_id_str' => 'copy_field',
      'pol_easy_driver_code_str' => 'copy_field',
      'pol_easy_driver_on_off_str' => 'copy_field',
      'pol_easy_driver_web_id_str' => 'translate_field',
      'pol_easy_driver_premium_id_str' => 'copy_field',
      'pol_glasses_on_off_str' => 'copy_field',
      'pol_glasses_web_id_str' => 'translate_field',
      'pol_glasses_premium_id_str' => 'copy_field',
      'pol_kasko_on_off_str' => 'copy_field',
      'pol_kasko_web_id_str' => 'copy_field',
      'pol_kasko_premium_id_str' => 'copy_field',
      'pol_legal_assistance_on_off_str' => 'copy_field',
      'pol_legal_assistance_web_id_str' => 'translate_field',
      'pol_legal_assistance_premium_id_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_on_off_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_web_id_str' => 'copy_field',
      'pol_natural_events_act_of_vandalism_premium_id_str' => 'copy_field',
      'pol_natural_events_on_off_str' => 'copy_field',
      'pol_natural_events_web_id_str' => 'copy_field',
      'pol_natural_events_premium_id_str' => 'copy_field',
      'pol_road_assistance_code_str' => 'copy_field',
      'pol_road_assistance_on_off_str' => 'copy_field',
      'pol_road_assistance_web_id_str' => 'copy_field',
      'pol_road_assistance_premium_id_str' => 'copy_field',
      'pol_social_political_and_natural_events_code_str' => 'copy_field',
      'pol_social_political_and_natural_events_on_off_str' => 'copy_field',
      'pol_social_political_and_natural_events_web_id_str' => 'copy_field',
      'pol_social_political_and_natural_events_premium_id_str' => 'copy_field',
      'pol_social_political_events_code_str' => 'copy_field',
      'pol_social_political_events_on_off_str' => 'copy_field',
      'pol_social_political_events_web_id_str' => 'copy_field',
      'pol_social_political_events_premium_id_str' => 'copy_field',
      'pol_supplementary_coverage_code_str' => 'copy_field',
      'pol_supplementary_coverage_on_off_str' => 'copy_field',
      'pol_supplementary_coverage_web_id_str' => 'copy_field',
      'pol_supplementary_coverage_premium_id_str' => 'copy_field',
      'pol_act_of_vandalism_code_str' => 'copy_field',
      'pol_record_id_str' => 'copy_field',
#      'driv_job_2_str' => 'copy_field',
      'pol_subscriber_is_holder_str'=> 'copy_field' ,
      'pol_theft_fire_coverage_code_str'=> 'copy_field' ,
      'pol_theft_fire_coverage_on_off_str'=> 'copy_field' ,
      'pol_theft_fire_coverage_web_id_str'=> 'translate_field' ,
      'pol_theft_fire_coverage_premium_id_str'=> 'copy_field' ,
      'pol_vehicle_continuous_use_no_of_mths_str'=> 'copy_field' ,
#      'veh_home_delivery_str'=> 'copy_field' ,
#      'veh_hook_str'=> 'copy_field' ,
#      'veh_inflammable_liquid_transportation_str'=> 'copy_field' ,
#      'veh_liquid_fuel_transportation_str'=> 'copy_field' ,
#      'veh_loading_unloading_str'=> 'copy_field' ,
#      'veh_corrosive_oily_gas_liquid_transportation_str'=> 'copy_field' ,
#      'veh_full_load_total_weight_num'=> 'copy_field' ,
#      'pol_motorcycle_driving_ability_str'=> 'copy_field' ,
#      'pol_public_liability_type_str'=> 'copy_field' ,
#      'pol_second_driver_str'=> 'copy_field' ,
#      'pol_passenger_str'=> 'copy_field' ,
#      'pol_policy_starting_date_year_num'=> 'copy_field' ,
#      'pol_policy_starting_date_month_str'=> 'copy_field' ,
#      'pol_policy_starting_date_day_str'=> 'copy_field' ,
#      'veh_marble_blocks_str'=> 'copy_field' ,
#      'veh_passenger_transportation_str'=> 'copy_field' ,
#      'veh_product_sector_str'=> 'copy_field' ,
#      'veh_radioactive_substances_transportation_str'=> 'copy_field' ,
#      'veh_rent_str'=> 'copy_field' ,
#      'veh_rent_with_driver_str'=> 'copy_field' ,
#      'veh_third_party_str'=> 'copy_field' ,
#      'veh_toxic_gas_explosive_transportation_str'=> 'copy_field' ,
#      'veh_transportation_of_dangerous_goods_A_str'=> 'copy_field' ,
#      'veh_transportation_of_dangerous_goods_B_str'=> 'copy_field' ,
#      'veh_transportation_type_str'=> 'copy_field' ,
#      'veh_truck_tractor_weight_num'=> 'copy_field' ,
#      'veh_use_for_shops_str'=> 'copy_field' ,
#      'veh_weight_to_be_towed_num'=> 'copy_field' ,
#      'pol_kasko_minimum_uncoverage_str'=> 'copy_field' ,
#      'pol_bersani_ref_vehicle_insured_with_company_str'=> 'copy_field' ,
      'pol_collision_code_str' => 'copy_field' ,
      'pol_collision_on_off_str' => 'copy_field' ,
      'pol_collision_premium_id_str' => 'copy_field' ,
      'pol_collision_web_id_str' => 'copy_field' ,
      'pol_protected_bonus_code_str' => 'copy_field' ,
      'pol_protected_bonus_on_off_str' => 'copy_field' ,
      'pol_protected_bonus_premium_id_str' => 'copy_field' ,
      'pol_protected_bonus_web_id_str' => 'copy_field' ,
      'pol_protection_24_code_str' => 'copy_field' ,
      'pol_protection_24_on_off_str' => 'copy_field' ,
      'pol_protection_24_premium_id_str' => 'copy_field' ,
      'pol_protection_24_web_id_str' => 'copy_field' ,
      'pol_public_liability_young_exemption_str' => 'copy_field'

    }

  end

end
