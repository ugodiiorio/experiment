#!/usr/bin/ruby

# Module defined in specific_profile.rb file

module Specific_Profile

  def build_specific_profile()

    @dbh.query_with_result = true

    stmt_companies = @dbh.prepare(@stmt_sel_company)
    stmt_companies.execute(@company_group_id, @company_id)
    raise RangeError, "No " + @company_id + " company exist for specified companies group " + @company_group_id  if stmt_companies.affected_rows() == 0
    while row_company = stmt_companies.fetch do

      @company_id = row_company[0]

      stmt_generic_profile = @dbh.prepare(@stmt_sel_filter_profile)
    #  stmt_generic_profile.bind_result(infield)
      stmt_generic_profile.execute(@provider_id, @sector_id, @company_group_id, @working_set_id)
  #    puts "Number of profile rows selected: #{stmt_generic_profile.affected_rows()}"
  #    puts stmt_generic_profile.row_tell()
  #    puts stmt_generic_profile.num_rows()

      while row_profile = stmt_generic_profile.fetch do

        @id_profile = row_profile[0]
        insert_field()

        profilefield = build_profile_fields_hash(row_profile)

        @profile.each do |key, value|

          @profile_field = key
          @profile_value = value

          stmt_rules = @dbh.prepare(@stmt_sel_rules)
  #        stmt_rules.bind_result(@translation)
          stmt_rules.execute(@provider_id, @sector_id, @company_id, @profile_field)
  #        puts "Number of profile rows selected #{stmt_rules.affected_rows()}"

          while row_rule = stmt_rules.fetch do

            rule = row_rule[0]
            comp_profile_value = eval(rule)
  #          rule ? comp_profile_value = translate_field() : comp_profile_value = copy_field()

            stmt_upd_profile = @stmt_upd_profile.sub("@@profile_field@@", @profile_field)
            stmt = @dbh.prepare(stmt_upd_profile)
            stmt.execute(comp_profile_value, @id_profile, @provider_id, @sector_id, @company_id, @working_set_id)
            @profile_num += stmt.affected_rows().to_i
          end
    #
          @logger.warn(__LINE__) \
                            {"No rule provided for FIELD: #{@profile_field.upcase} with KEY: #{@provider_id.upcase}-#{@sector_id.upcase}-#{@company_id.upcase}-#{@profile_field.upcase}"} \
                            if stmt_rules.affected_rows() == 0

          stmt_rules.close
          end
        end
        stmt_generic_profile.close
      end
      stmt_companies.close
  #  end
  #  puts "Number of file rows returned: #{res_file.num_rows}"
  #  @row_num += res_file.num_rows.to_i
  #  res_file.free

  end

  def insert_field()

    begin
      stmt_comp_profile = @dbh.prepare(@stmt_ins_profile)
      stmt_comp_profile.execute(@id_profile, @provider_id, @sector_id, @company_id, @working_set_id)
      @profile_num += stmt_comp_profile.affected_rows().to_i
      stmt_comp_profile.close
    rescue Mysql::Error => e
      @logger.warn(__LINE__) {"Warning message: #{e.error}"} if e.errno == 1062
      raise ex unless e.errno == 1062
    rescue Exception => e
      raise e
    end

  end

  def build_profile_fields_hash(row_profile)

        id = 0
        @profile = {}
        profilefield = {}

        row_profile.each do |profile_value|
          @profile = @profile.merge({ @fieldname[id] => profile_value }) if @fieldname[id]
          id += 1
        end
        @profile.collect { |key, value| profilefield[key.to_sym] = value }
        return profilefield

  end
    
  def translate_field(comp_profile_field = @profile_field)

    profile_value = @profile[comp_profile_field.to_s]
    stmt_translation = @dbh.prepare(@stmt_sel_translated)
    stmt_translation.execute(@provider_id, @sector_id, @company_id, comp_profile_field.to_s, profile_value)

    while row_translation = stmt_translation.fetch do
      field_value = row_translation[0]
    end

    @logger.error(__LINE__) \
                      {"No translation provided for FIELD: #{comp_profile_field.to_s.upcase} with KEY: #{@provider_id.upcase}-#{@sector_id.upcase}-#{@company_id.upcase}-#{comp_profile_field.to_s.upcase}-#{profile_value}"} \
                      if stmt_translation.affected_rows() == 0

    stmt_translation.close
    return field_value

  end

  def copy_field(comp_profile_field = @profile_field)

    field_value = @profile[comp_profile_field.to_s]
    return field_value

  end

  def calculate_field(comp_profile_field)

    field_value = comp_profile_field
    return field_value

  end

end
