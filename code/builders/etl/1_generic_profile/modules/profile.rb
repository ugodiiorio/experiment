#!/usr/bin/ruby

# Module defined in profile.rb file

require "active_support"
require "date.rb"
require "date/format.rb"

module Profile

  def build_profile()

    @dbh.query_with_result = true
    infield = {}
#    mapfield = {}



    stmt = @stmt_sel_input.sub("@@input_file@@", @input_file)
    res_file = @dbh.query(stmt)
    res_file.each_hash do |file|
      @id += 1
      file.collect { |key, value| infield[key.to_sym] = value }

      stmt = @dbh.prepare(@stmt_ins_profile)
      stmt.execute(@id, @provider_id, @sector_id, @company_group_id, @working_set_id)
  #    puts "Number of profile rows inserted: #{stmt.affected_rows()}"
      @profile_num += stmt.affected_rows().to_i
      stmt.close

      stmt_map = @dbh.prepare(@stmt_filter_mapping)
      stmt_map.execute(@provider_id, @sector_id)

      while row_map = stmt_map.fetch do

        mapfield = build_profile_fields_hash(row_map)
        profile_field = mapfield[:key_output_field_str]
        profile_field_value = mapfield[:eval_str]
        
        begin
          mapfield[:eval_str] ? value = eval(mapfield[:eval_str].to_s).to_s : value = nil
        rescue Exception => e
          raise RangeError, "Unexpected [#{e.message}] EVAL Error on: #{profile_field.upcase} => #{profile_field_value}"
        end

        stmt_upd_profile = @stmt_upd_profile.sub("@@profile_field@@", profile_field)
        stmt = @dbh.prepare(stmt_upd_profile)
        stmt.execute(value, @id.to_s, @provider_id, @sector_id, @company_group_id, @working_set_id)
        stmt.close

      end
      stmt_map.close

    end
  #  puts "Number of file rows returned: #{res_file.num_rows}"
    @row_num += res_file.num_rows.to_i
    res_file.free

  end

  def build_profile_fields_hash(row_map)

    id = 0
    mapfield = {}

    row_map.each do |map_value|
      mapfield = mapfield.merge({ @fieldname[id].to_sym => map_value }) if @fieldname[id]
      id += 1
    end
    return mapfield

  end

end
