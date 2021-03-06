module Provider2ZurichConnect
  
  def build_hash_sect_1()

    @target_values = Hash.new

    @target_values = {
      
      {'driv_civil_status_str' => 'Coniugato senza figli'} => 'Coniugato senza figli',
      {'driv_studies_str' => 'diploma'} => 'Diploma',
      {'own_owner_sex_str' => 'C'} => 'PersonaGiuridica',
      {'own_owner_sex_str' => 'F'} => 'Femmina',
      {'own_owner_sex_str' => 'M'} => 'Maschio',
      {'pol_bersani_str' => 'no'} => 'NO',
      {'pol_bersani_str' => 'si'} => 'SI',
      {'pol_blukasko_web_id_str' => 'id elemento'} => 'chkKaskoParziale',
      {'pol_BM_assigned_str' => '0'} => '1',
      {'pol_BM_assigned_str' => '1'} => '1',
      {'pol_BM_assigned_str' => '2'} => '2',
      {'pol_BM_assigned_str' => '3'} => '3',
      {'pol_BM_assigned_str' => '4'} => '4',
      {'pol_BM_assigned_str' => '5'} => '5',
      {'pol_BM_assigned_str' => '6'} => '6',
      {'pol_BM_assigned_str' => '7'} => '7',
      {'pol_BM_assigned_str' => '8'} => '8',
      {'pol_BM_assigned_str' => '9'} => '9',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_claims_total_number_str'  => '0'} => 'Nessun sinistro',
      {'pol_claims_total_number_str'  => '1'} => '1 sinistro',
      {'pol_claims_total_number_str'  => '2'} => '2 sinistri',
      {'pol_claims_total_number_str'  => '3'} => '4 sinistri e oltre',
      {'pol_defined_drive_str' => 'si'} => 'Guida Esperta',
      {'pol_driver_accident_coverage_web_id_str' => 'id elemento'} => 'chkInfortuniConducente',
      {'pol_driving_licence_withdrawal_guarantee_web_id_str' => 'id elemento'} => 'chkRitiroPatente',
      {'pol_driving_type_str' => 'esperta'} => 'Guida Esperta',
      {'pol_driving_type_str' => 'libera'} => 'Guida Libera',
      {'pol_family_members_insured_with_company_str' => '0'} => 'NO',
      {'pol_free_drive_str' => 'si'} => 'Guida Libera',
      {'pol_glasses_web_id_str' => 'id elemento'} => 'chkComplementareARD',
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'Passaparola',
      {'pol_instalment_str' => 'annuale'} => 'Annuale',
      {'pol_instalment_str' => 'semestrale'} => 'Semestrale',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Sto acquistando un\'auto usata e mi assicuro per la prima volta',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'L\'automobile e\' gia\' assicurata con un contratto in Bonus/Malus',
      {'pol_kasko_web_id_str' => 'id elemento'} => 'chkKaskoCompleta',
      {'pol_legal_assistance_web_id_str' => 'id elemento'} => 'chkTutelaGiud',
      {'pol_natural_events_web_id_str' => 'id elemento'} => 'chkEventiNaturali',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '0'} => '0 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '1'} => '1 anno',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '2'} => '2 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '3'} => '3 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '4'} => '4 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '5'} => '5 anni',
      {'pol_public_liability_indemnity_limit_str' => '12,000,000'} => '6.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '18,000,000'} => '20.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '20,000,000'} => '20.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '25,000,000'} => '20.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '4.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 UNICO',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'lblvPremioAnnualeLordo lblvPremioAnnualeLordoSconto',
      {'pol_road_assistance_web_id_str' => 'id elemento'} => 'chkAssistenza',
      {'pol_social_political_events_web_id_str' => 'id elemento'} => 'chkEventiSociopolitici',
      {'pol_subscriber_is_owner_str' => 'no'} => 'NO',
      {'pol_subscriber_is_owner_str' => 'si'} => 'SI',
      {'pol_theft_fire_coverage_web_id_str' => 'id elemento'} => 'chkIncendioFurto',
      {'veh_abs_str' => 'no'} => 'ABS assente',
      {'veh_abs_str' => 'si'} => 'ABS presente',
      {'veh_airbag_str' => 'no'} => 'Assente',
      {'veh_airbag_str' => 'si'} => 'Airbag lato guida',
      {'veh_alarm_str' => 'nessuno'} => 'ASSENTE',
      {'veh_antiskid_str' => 'no'} => 'Assente',
      {'veh_fuel_str' => 'benzina'} => 'BENZINA',
      {'veh_fuel_str' => 'diesel'} => 'DIESEL',
      {'veh_fuel_str' => 'G'} => 'GPL',
      {'veh_fuel_str' => 'M'} => 'METANO',
      {'veh_num_of_owners_str' => '1'} => '1',
      {'veh_stabilizer_str' => 'no'} => 'NO',
      {'veh_tow_hook_str' => 'no'} => 'Senza gancio traino',

    }

  end

  def build_hash_sect_2()

    @target_values = {}

    @target_values = {

      {'driv_civil_status_str' => 'Coniugato con figli'} => 'Coniugato senza figli',
      {'driv_studies_str' => 'diploma'} => 'Diploma',
      {'own_owner_sex_str' => 'M'} => 'Maschio',
      {'own_owner_sex_str' => 'F'} => 'Femmina',
      {'own_owner_sex_str' => 'C'} => 'PersonaGiuridica',
      {'pol_bersani_str' => 'si'} => 'SI',
      {'pol_bersani_str' => 'no'} => 'NO',
      {'pol_BM_assigned_str' => '0'} => '1',
      {'pol_BM_assigned_str' => '1'} => '1',
      {'pol_BM_assigned_str' => '2'} => '2',
      {'pol_BM_assigned_str' => '3'} => '3',
      {'pol_BM_assigned_str' => '4'} => '4',
      {'pol_BM_assigned_str' => '5'} => '5',
      {'pol_BM_assigned_str' => '6'} => '6',
      {'pol_BM_assigned_str' => '7'} => '7',
      {'pol_BM_assigned_str' => '8'} => '8',
      {'pol_BM_assigned_str' => '9'} => '9',
      {'pol_BM_assigned_str' => '10'} => '10',
      {'pol_BM_assigned_str' => '11'} => '11',
      {'pol_BM_assigned_str' => '12'} => '12',
      {'pol_BM_assigned_str' => '13'} => '13',
      {'pol_BM_assigned_str' => '14'} => '14',
      {'pol_BM_assigned_str' => '15'} => '15',
      {'pol_BM_assigned_str' => '16'} => '16',
      {'pol_BM_assigned_str' => '17'} => '17',
      {'pol_BM_assigned_str' => '18'} => '18',
      {'pol_claims_total_number_str'  => '0'} => 'Nessun sinistro                                                                                                                                                                                         ',
      {'pol_claims_total_number_str'  => '1'} => '1 sinistro                                                                                                                                                                                              ',
      {'pol_claims_total_number_str'  => '2'} => '2 sinistri                                                                                                                                                                                              ',
      {'pol_claims_total_number_str'  => '3'} => '4 sinistri e oltre                                                                                                                                                                                      ',
      {'pol_family_members_insured_with_company_str' => '0'} => 'NO',
      {'pol_how_do_you_know_the_company_str' => 'passaparola'} => 'Passaparola',
      {'pol_insurance_situation_str' => 'proveniente da altra compagnia'} => 'Il motociclo e\' gia\' assicurato con un contratto in Bonus/Malus',
      {'pol_insurance_situation_str' => '1a immatricolazione'} => 'Sto acquistando un motociclo nuovo/usato e mi assicuro per la prima volta',
      {'pol_legal_assistance_web_id_str'  => 'id elemento'} => 'chkTutelaGiud',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '0'} => '0 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '1'} => '1 anno',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '2'} => '2 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '3'} => '3 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '4'} => '4 anni',
      {'pol_nr_of_yrs_insured_in_the_last_5_yrs_str' => '5'} => '5 anni',
      {'pol_public_liability_indemnity_limit_str' => '20,000,000'} => '20.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '4,000,000'} => '4.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '6,000,000'} => '6.000.000 UNICO',
      {'pol_public_liability_indemnity_limit_str' => '3,000,000'} => '2.500.000 - 500.000',
      {'pol_RCA_premium_id_str' => 'id elemento'} => 'lblvPremioAnnualeLordo',
      {'pol_road_assistance_web_id_str' => 'id elemento'} => 'chkAssistenza',
      {'pol_subscriber_is_owner_str' => 'si'} => 'SI',
      {'pol_subscriber_is_owner_str' => 'no'} => 'NO',
      {'pol_theft_fire_coverage_web_id_str'  => 'id elemento'} => 'chkIncendioFurto',
      {'veh_num_of_owners_str' => '1'} => '1',

    }
  end
  
end