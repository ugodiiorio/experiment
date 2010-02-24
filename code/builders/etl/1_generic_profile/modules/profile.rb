#!/usr/bin/ruby

# Module defined in profile.rb file

require "active_support"
require "date.rb"
require "date/format.rb"

module Profile

  def build_profile()

    @dbh.query_with_result = true
    infield = {}
    mapfield = {}

    stmt = @stmt_sel_input.sub("@@input_file_table@@", @input_file)
    res_file = @dbh.query(stmt)
    res_file.each_hash do |file|
      @id += 1
      file.collect { |key, value| infield[key.to_sym] = value }

      stmt = @dbh.prepare(@stmt_ins_profile)
      stmt.execute(@id, @provider_id, @sector_id, @company_group_id, @working_set_id)
  #    puts "Number of profile rows inserted: #{stmt.affected_rows()}"
      @profile_num += stmt.affected_rows().to_i
      stmt.close

      stmt = @stmt_sel_mapping.sub("@@provider_id@@", quote(@provider_id)).sub("@@sector_id@@", quote(@sector_id))
      res_map = @dbh.query(stmt)

      res_map.each_hash do |map|
        map.collect { |key, value| mapfield[key.to_s.to_sym] = value }
        profile_field = mapfield[:output_field_str]
        mapfield[:eval_str] ? value = eval(mapfield[:eval_str].to_s).to_s : value = nil 

        stmt_upd_profile = @stmt_upd_profile.sub("@@profile_field@@", profile_field)
        stmt = @dbh.prepare(stmt_upd_profile)
        stmt.execute(value, @id.to_s)
        stmt.close

      end
      res_map.free
    end
  #  puts "Number of file rows returned: #{res_file.num_rows}"
    @row_num += res_file.num_rows.to_i
    res_file.free

  end

  def quote(s)
    return "'" + s + "'"
  end

end
