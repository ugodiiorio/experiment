#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Target_Quixa

  def build_hash_sect_1()

#     target_values["fname_fvalue"]

    @target_values = Hash.new

    @target_values = {
      {'driv_birth_place_str' => 'CASALE CORTE CERRO'} => "CASALE CORTE CERRO",
      {'driv_birth_province_str' => 'VB'} => "VERBANO CUSIO OSSOLA",
      {'driv_birth_province_str' => 'VR'} => "VERONA",
      {'pol_bersani_str' => 'Convivente'} => 'si, parente/convivente',
      {'pol_bersani_str' => 'Veicolo'} => 'si, 2º veicolo del medesimo proprietario',
      {'pol_bersani_str' => 'No'} => 'no',
      {'pol_BM_assigned_str' => '-1'} => '1 da più di un anno',
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
      {'pol_client_type_str' => 'M'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_rbtPersonIndividual',
      {'pol_client_type_str' => 'F'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_rbtPersonIndividual',
      {'pol_client_type_str' => 'C'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_rbtPersonLegal',
      {'pol_coming_from_company_str' => 'generali'} => 'ASSICURAZIONI GENERALI',
      {'pol_driver_less_than_26_yrs_str' => 'N'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_btnAge26Group_1',
      {'pol_driver_less_than_26_yrs_str' => 'S'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_btnAge26Group_0',
      {'pol_driver_sex_str' => 'M'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_rdSexo_0',
      {'pol_driver_sex_str' => 'F'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_rdSexo_1 ',
      {'pol_instalment_str' => 'ANNUALE'} => 'Annuale',
      {'pol_instalment_str' => 'SEMESTRALE'} => 'Semestrale',
      {'pol_insurance_situation_str' => 'VEICOLO GIA\' ASSICURATO CON ATR'} => 'Veicolo già assicurato con attestato di rischio',
      {'pol_insurance_situation_str' => '1° POLIZZA DOPO L\'ACQUISTO DEL VEICOLO'} => 'Prima Polizza dopo l\'acquisto di un veicolo',
      {'pol_leasing_str' => 'no'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_rbtLeasingNo',
      {'pol_nr_of_paid_claims_1_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_1_yr_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_1_yr_str' => '2'} => '>1',
      {'pol_nr_of_paid_claims_1_yr_str' => 'N/A'} => 'N/A',
      {'pol_nr_of_paid_claims_1_yr_str' => 'N/D'} => 'N/D',
      {'pol_nr_of_paid_claims_2_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_2_yr_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_2_yr_str' => '2'} => '>1',
      {'pol_nr_of_paid_claims_2_yr_str' => 'N/A'} => 'N/A',
      {'pol_nr_of_paid_claims_2_yr_str' => 'N/D'} => 'N/D',
      {'pol_nr_of_paid_claims_3_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_3_yr_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_3_yr_str' => '2'} => '>1',
      {'pol_nr_of_paid_claims_3_yr_str' => 'N/A'} => 'N/A',
      {'pol_nr_of_paid_claims_3_yr_str' => 'N/D'} => 'N/D',
      {'pol_nr_of_paid_claims_4_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_4_yr_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_4_yr_str' => '2'} => '>1',
      {'pol_nr_of_paid_claims_4_yr_str' => 'N/A'} => 'N/A',
      {'pol_nr_of_paid_claims_4_yr_str' => 'N/D'} => 'N/D',
      {'pol_nr_of_paid_claims_5_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_5_yr_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_5_yr_str' => '2'} => '>1',
      {'pol_nr_of_paid_claims_5_yr_str' => 'N/A'} => 'N/A',
      {'pol_nr_of_paid_claims_5_yr_str' => 'N/D'} => 'N/D',
      {'pol_nr_of_paid_claims_this_yr_str' => '0'} => '0',
      {'pol_nr_of_paid_claims_5_yr_str' => '1'} => '1',
      {'pol_nr_of_paid_claims_5_yr_str' => '2'} => '>1',
      {'pol_nr_of_paid_claims_5_yr_str' => 'N/A'} => 'N/A',
      {'pol_nr_of_paid_claims_5_yr_str' => 'N/D'} => 'N/D',
      {'pol_payment_str' => 'carta di credito'} => 'Carta di Credito',
      {'pol_public_liability_indemnity_limit_str' => '3000000'} => '3.000.000 € - 2.500.000 € - 500.000 €',
      {'pol_public_liability_indemnity_limit_str' => '25000000'} => '25.000.000 € - 20.000.000 € - 5.000.000 €',
      {'pol_public_liability_indemnity_limit_str' => '18000000'} => '18.000.000 € - 15.000.000 € - 3.000.000 €',
      {'pol_public_liability_indemnity_limit_str' => '12000000'} => '12.000.000 € - 10.000.000 € - 2.000.000 €',
      {'pol_public_liability_indemnity_limit_str' => '6000000'} => '6.000.000 € - 5.000.000 € - 1.000.000 €',
      {'veh_alarm_str' => 'immobilizer'} => 'ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_rbtSatelliteLocationNo',
      {'veh_fuel_str' => 'B'} => 'Benzina',
      {'veh_fuel_str' => 'D'} => 'Diesel',
      {'veh_fuel_str' => 'G'} => 'GPL',
      {'veh_fuel_str' => 'M'} => 'Metano',
      {'veh_habitual_vehicle_use_str' => 'tempo libero-casa lavoro'} => 'Casa-Lavoro e Tempo Libero',
      {'veh_km_per_yr_num' => '15000'} => '10.000 - 20.000',
      {'veh_vehicle_value_str' => '5000'} => '5000'
      }











































#  costruisci hash ["field_name + field_value","target"]
  end


 
#  def insert_field()
#
#    begin
#      stmt_comp_profile = @dbh.prepare(@stmt_ins_tr_field)
#      stmt_comp_profile.execute(@id_profile, @provider_id, @sector_id, @company_id, @working_set_id)
#      @profile_num += stmt_comp_profile.affected_rows().to_i
#      stmt_comp_profile.close
#    rescue Mysql::Error => e
#      @logger.warn(__LINE__) {"Warning message: #{e.error}"} if e.errno == 1062
#      raise ex unless e.errno == 1062
#    rescue Exception => e
#      raise e
#    end
#
#  end
#
#  def translate_field(comp_profile_field = @profile_field)
#
#    profile_value = @profile[comp_profile_field.to_s]
#    stmt_translation = @dbh.prepare(@stmt_sel_translated)
#    stmt_translation.execute(@provider_id, @sector_id, @company_id, comp_profile_field.to_s, profile_value)
#
#    while row_translation = stmt_translation.fetch do
#      field_value = row_translation[0]
#    end
#
#    @logger.error(__LINE__) \
#                      {"No translation provided for FIELD: #{comp_profile_field.to_s.upcase} with KEY: #{@provider_id.upcase}-#{@sector_id.upcase}-#{@company_id.upcase}-#{comp_profile_field.to_s.upcase}-#{profile_value}"} \
#                      if stmt_translation.affected_rows() == 0
#
#    stmt_translation.close
#    return field_value
#
#  end
#
#  def copy_field(comp_profile_field = @profile_field)
#
#    field_value = @profile[comp_profile_field.to_s]
#    return field_value
#
#  end
#
#  def calculate_field(comp_profile_field)
#
#    field_value = comp_profile_field
#    return field_value
#
#  end

end
