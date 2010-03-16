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

  def normalize(var)

    arr_var = var.to_s.split("_")
    arr_var.pop
    arr_var.delete(arr_var.first)
    var = arr_var.collect{|a| a + "_"}.to_s.chop.downcase
    return var

  end

end
