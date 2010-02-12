#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Regexp_Eval_Quixa

  def build_hash_regexp_sect_1()

#     target_values["fname_fvalue"]

    @eval_values = Hash.new

    @eval_values = { 'veh_make_str'  => "funz",
       {'veh_model_str' => 'VB'} => "funz",
       {'veh_set_up_str' => 'VR'} => "funz",
       {'veh_job_str' => 'M'} => "funz",
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
