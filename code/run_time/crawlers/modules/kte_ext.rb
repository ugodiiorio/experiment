# To change this template, choose Tools | Templates
# and open the template in the editor.

module Kernel
private
   def method_name
     caller[0] =~ /`([^']*)'/ and $1
   end
end

class String
  def camelize
    self.split(/[^a-z0-9]/i).map{|w| w.capitalize}.join
  end

  def to_class(parent = Kernel)
    chain = self.split "::"
    klass = parent.const_get chain.shift
    return chain.size < 1 ? (klass.is_a?(Class) ? klass : nil) : chain.join("::").to_class(klass)
    rescue
      nil
  end
end

module KteExt

  def is_numeric?(n)
    Float n rescue false
  end
  def view_hash()

    view = Hash.new
    view = {
      'sect_1' => 'sector_1',
      'sect_2' => 'sector_2',
      'sect_3' => 'sector_3',
      'sect_4' => 'sector_4',
      }
  end

  def start_range(p)

    @profile_array = @kte.profile.split(',')
    @profile_array.size > 1 ? first_profile = 0 : first_profile = 1
    profile_range = @kte.profile.split('..').inject { |s,e| s.to_i..e.to_i } unless @profile_array.size > 1
    profile_range.is_a?(Range) ? first_profile = profile_range.first : first_profile = 1 unless @profile_array.size > 1
    return first_profile
    
  end

  def end_range(p)

    @profile_array = @kte.profile.split(',')
    @profile_array.size > 1 ? end_profile = (@profile_array.size.to_i - 1) : end_profile = p
    profile_range = @kte.profile.split('..').inject { |s,e| s.to_i..e.to_i } unless @profile_array.size > 1
    profile_range.is_a?(Range) ? end_profile = profile_range.end : end_profile = p unless @profile_array.size > 1
    return end_profile

  end

  def normalize(var)

    arr_var = var.to_s.split("_")
    arr_var.pop
    arr_var.delete(arr_var.first)
    var = arr_var.collect{|a| a + "_"}.to_s.chop.downcase
    return var

  end

end
