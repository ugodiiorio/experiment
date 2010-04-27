# To change this template, choose Tools | Templates
# and open the template in the editor.

$LOAD_PATH << File.join("~/.gem/ruby/1.8/gems/")

require 'rubygems'
gem 'text'


require 'text'


def similar (str1 , str2)
str1.downcase!
pairs1 = (0..str1.length-2).collect {|i| str1[i,2]}.reject {
  |pair| pair.include? " "}
str2.downcase!
pairs2 = (0..str2.length-2).collect {|i| str2[i,2]}.reject {
  |pair| pair.include? " "}
union = pairs1.size + pairs2.size
intersection = 0
pairs1.each do |p1|
  0.upto(pairs2.size-1) do |i|
    if p1 == pairs2[i]
      intersection += 1
      pairs2.slice!(i)
      break
    end
  end
end
(2.0 * intersection) / union
end

#(element.scan(/\d/).join).include?(str.scan(/\d/).join)||str.scan(/\d/).join.include?(element.scan(/\d/).join)

def intersect  a , b
    a.inject([]) do |intersect, s|
      index = b.index(s)
      unless index.nil?
         intersect << s
         b.delete_at(index)
      end
      intersect
    end
end


def match (array, str)
  array.map {
    |element|
    [element,similar(element,str), Text::Levenshtein.distance(element,str),intersect(element.scan(/\d/),str.scan(/\d/))==str.scan(/\d/)]
  }
end



 #a= (distLev==0)?dist*100:dist*100/distLev]





["CORSA 1.0I 12V CAT 3 PORTE - 9/2000",
"CORSA 1.0I 12V CAT 3 PORTE CLUB - 12/2003",
"CORSA 1.0I 12V CAT 3 PORTE CLUB - 7/2002",
"CORSA 1.0I 12V CAT 3 PORTE CLUB - 8/2003",
"CORSA 1.0I 12V CAT 3 PORTE COMFORT - 9/2000",
"CORSA 1.0I 12V CAT 3 PORTE EDITION - 1/2003",
"CORSA 1.0I 12V CAT 3 PORTE ENJOY - 8/2003",
"CORSA 1.0I 12V CAT 3 PORTE MUSICLINE - 9/2004",
"CORSA 1.0I 12V CAT 5 PORTE - 9/2000",
"CORSA 1.0I 12V CAT 5 PORTE CLUB - 12/2003",
"CORSA 1.0I 12V CAT 5 PORTE CLUB - 7/2002",
"CORSA 1.0I 12V CAT 5 PORTE CLUB - 8/2003",
"CORSA 1.0I 12V CAT 5 PORTE COMFORT - 9/2000",
"CORSA 1.0I 12V CAT 5 PORTE EDITION - 1/2003",
"CORSA 1.0I 12V CAT 5 PORTE ENJOY - 8/2003",
"CORSA 1.0I 12V CAT 5 PORTE MUSICLINE - 9/2004",
"CORSA 1.2I 16V CAT 3 PORTE 'NJOY - 1/2003",
"CORSA 1.2I 16V CAT 3 PORTE 'NJOY - 7/2002",
"CORSA 1.2I 16V CAT 3 PORTE - 9/2000",
"CORSA 1.2I 16V CAT 3 PORTE CLUB - 12/2003",
"CORSA 1.2I 16V CAT 3 PORTE CLUB - 7/2002",
"CORSA 1.2I 16V CAT 3 PORTE CLUB - 8/2003",
"CORSA 1.2I 16V CAT 3 PORTE CLUB - 9/2004",
"CORSA 1.2I 16V CAT 3 PORTE COMFORT - 9/2000",
"CORSA 1.2I 16V CAT 3 PORTE COSMO - 8/2003",
"CORSA 1.2I 16V CAT 3 PORTE COSMO - 9/2004",
"CORSA 1.2I 16V CAT 3 PORTE EDITION - 1/2003",
"CORSA 1.2I 16V CAT 3 PORTE ELEGANCE - 9/2000",
"CORSA 1.2I 16V CAT 3 PORTE ENJOY - 8/2003",
"CORSA 1.2I 16V CAT 3 PORTE ENJOY - 8/2004",
"CORSA 1.2I 16V CAT 3 PORTE FASHION LINE - 2/2004",
"CORSA 1.2I 16V CAT 3 PORTE MUSICLINE - 9/2004",
"CORSA 1.2I 16V CAT 3 PORTE SPORT - 8/2003",
"CORSA 1.2I 16V CAT 3 PORTE SPORT - 9/2000",
"CORSA 1.2I 16V CAT 3 PORTE SPORT - 9/2004",
"CORSA 1.2I 16V CAT 3P. SPORT IRMSCHER - 1/2003",
"CORSA 1.2I 16V CAT 3P. SPORT IRMSCHER - 8/2001",
"CORSA 1.2I 16V CAT 5 PORTE 'NJOY - 1/2003",
"CORSA 1.2I 16V CAT 5 PORTE 'NJOY - 7/2002",
"CORSA 1.2I 16V CAT 5 PORTE - 9/2000",
"CORSA 1.2I 16V CAT 5 PORTE CLUB - 12/2003",
"CORSA 1.2I 16V CAT 5 PORTE CLUB - 7/2002",
"CORSA 1.2I 16V CAT 5 PORTE CLUB - 8/2003",
"CORSA 1.2I 16V CAT 5 PORTE CLUB - 9/2004",
"CORSA 1.2I 16V CAT 5 PORTE COMFORT - 9/2000",
"CORSA 1.2I 16V CAT 5 PORTE COSMO - 8/2003",
"CORSA 1.2I 16V CAT 5 PORTE COSMO - 9/2004",
"CORSA 1.2I 16V CAT 5 PORTE EDITION - 1/2003",
"CORSA 1.2I 16V CAT 5 PORTE ELEGANCE - 9/2000",
"CORSA 1.2I 16V CAT 5 PORTE ENJOY - 8/2003",
"CORSA 1.2I 16V CAT 5 PORTE ENJOY - 9/2004",
"CORSA 1.2I 16V CAT 5 PORTE FASHION LINE - 2/2004",
"CORSA 1.2I 16V CAT 5 PORTE MUSICLINE - 9/2004",
"CORSA 1.2I 16V CAT 5 PORTE SPORT - 8/2003",
"CORSA 1.2I 16V CAT 5 PORTE SPORT - 9/2004",
"CORSA 1.4I 16V CAT 3 PORTE 'NJOY - 1/2003",
"CORSA 1.4I 16V CAT 3 PORTE 'NJOY - 7/2002",
"CORSA 1.4I 16V CAT 3 PORTE COMFORT - 9/2000",
"CORSA 1.4I 16V CAT 3 PORTE COSMO - 8/2003",
"CORSA 1.4I 16V CAT 3 PORTE EDITION - 1/2003",
"CORSA 1.4I 16V CAT 3 PORTE ELEGANCE - 9/2000",
"CORSA 1.4I 16V CAT 3 PORTE ENJOY - 8/2003",
"CORSA 1.4I 16V CAT 3 PORTE FASHION LINE - 2/2004",
"CORSA 1.4I 16V CAT 3 PORTE MUSICLINE - 8/2004",
"CORSA 1.4I 16V CAT 3 PORTE SPORT - 8/2003",
"CORSA 1.4I 16V CAT 3 PORTE SPORT - 9/2000",
"CORSA 1.4I 16V CAT 3P. SPORT IRMSCHER - 1/2003",
"CORSA 1.4I 16V CAT 3P. SPORT IRMSCHER - 8/2001",
"CORSA 1.4I 16V CAT 5 PORTE 'NJOY - 1/2003",
"CORSA 1.4I 16V CAT 5 PORTE 'NJOY - 7/2002",
"CORSA 1.4I 16V CAT 5 PORTE COMFORT - 9/2000",
"CORSA 1.4I 16V CAT 5 PORTE COSMO - 8/2003",
"CORSA 1.4I 16V CAT 5 PORTE EDITION - 1/2003",
"CORSA 1.4I 16V CAT 5 PORTE ELEGANCE - 9/2000",
"CORSA 1.4I 16V CAT 5 PORTE ENJOY - 8/2003",
"CORSA 1.4I 16V CAT 5 PORTE FASHION LINE - 2/2004",
"CORSA 1.4I 16V CAT 5 PORTE MUSICLINE - 8/2004",
"CORSA 1.4I 16V CAT 5 PORTE SPORT - 8/2003",
"CORSA 1.8I 16V CAT 3 PORTE GSI - 9/2000",
"CORSA 1.8I 16V CAT 3 PORTE SPORT - 8/2003",
"CORSA 1.8I 16V CAT 5 PORTE SPORT - 8/2003"]


 ["CORSA 1.3 16V CDTI CAT 3 PORTE CLUB - 8/2003",
"CORSA 1.3 16V CDTI CAT 3 PORTE COSMO - 8/2003",
"CORSA 1.3 16V CDTI CAT 3 PORTE ENJOY - 8/2003",
"CORSA 1.3 16V CDTI CAT 3 PORTE FAS. LINE - 2/2004",
"CORSA 1.3 16V CDTI CAT 3 PORTE MUSICLINE - 8/2004",
"CORSA 1.3 16V CDTI CAT 3 PORTE SPORT - 8/2003",
"CORSA 1.3 16V CDTI CAT 5 PORTE CLUB - 8/2003",
"CORSA 1.3 16V CDTI CAT 5 PORTE COSMO - 8/2003",
"CORSA 1.3 16V CDTI CAT 5 PORTE ENJOY - 8/2003",
"CORSA 1.3 16V CDTI CAT 5 PORTE FAS. LINE - 2/2004",
"CORSA 1.3 16V CDTI CAT 5 PORTE MUSICLINE - 8/2004",
"CORSA 1.3 16V CDTI CAT 5 PORTE SPORT - 8/2003",
"CORSA 1.7 16V CDTI CAT 3 PORTE COSMO - 8/2003",
"CORSA 1.7 16V CDTI CAT 3 PORTE ENJOY - 8/2003",
"CORSA 1.7 16V CDTI CAT 3 PORTE FAS. LINE - 2/2004",
"CORSA 1.7 16V CDTI CAT 3 PORTE MUSICLINE - 8/2004",
"CORSA 1.7 16V CDTI CAT 3 PORTE SPORT - 8/2003",
"CORSA 1.7 16V CDTI CAT 5 PORTE COSMO - 8/2003",
"CORSA 1.7 16V CDTI CAT 5 PORTE ENJOY - 8/2003",
"CORSA 1.7 16V CDTI CAT 5 PORTE FAS. LINE - 2/2004",
"CORSA 1.7 16V CDTI CAT 5 PORTE MUSICLINE - 8/2004",
"CORSA 1.7 16V CDTI CAT 5 PORTE SPORT - 8/2003",
"CORSA 1.7 16V DI CAT 3 PORTE 'NJOY - 1/2003",
"CORSA 1.7 16V DI CAT 3 PORTE 'NJOY - 7/2002",
"CORSA 1.7 16V DI CAT 3 PORTE - 9/2000",
"CORSA 1.7 16V DI CAT 3 PORTE CLUB - 7/2002",
"CORSA 1.7 16V DI CAT 3 PORTE COMFORT - 9/2000",
"CORSA 1.7 16V DI CAT 3 PORTE EDITION - 1/2003",
"CORSA 1.7 16V DI CAT 5 PORTE 'NJOY - 1/2003",
"CORSA 1.7 16V DI CAT 5 PORTE 'NJOY - 7/2002",
"CORSA 1.7 16V DI CAT 5 PORTE - 9/2000",
"CORSA 1.7 16V DI CAT 5 PORTE CLUB - 7/2002",
"CORSA 1.7 16V DI CAT 5 PORTE COMFORT - 9/2000",
"CORSA 1.7 16V DI CAT 5 PORTE EDITION - 1/2003",
"CORSA 1.7 16V DTI CAT 3 PORTE 'NJOY - 1/2003",
"CORSA 1.7 16V DTI CAT 3 PORTE 'NJOY - 7/2002",
"CORSA 1.7 16V DTI CAT 3 PORTE - 9/2000",
"CORSA 1.7 16V DTI CAT 3 PORTE CLUB - 7/2002",
"CORSA 1.7 16V DTI CAT 3 PORTE COMFORT - 9/2000",
"CORSA 1.7 16V DTI CAT 3 PORTE EDITION - 1/2003",
"CORSA 1.7 16V DTI CAT 3 PORTE ELEGANCE - 9/2000",
"CORSA 1.7 16V DTI CAT 3 PORTE SPORT - 9/2000",
"CORSA 1.7 16V DTI CAT 3P. SPORT IRMSCHER - 1/2003",
"CORSA 1.7 16V DTI CAT 3P. SPORT IRMSCHER - 8/2001",
"CORSA 1.7 16V DTI CAT 5 PORTE 'NJOY - 1/2003",
"CORSA 1.7 16V DTI CAT 5 PORTE 'NJOY - 7/2002",
"CORSA 1.7 16V DTI CAT 5 PORTE - 9/2000",
"CORSA 1.7 16V DTI CAT 5 PORTE CLUB - 7/2002",
"CORSA 1.7 16V DTI CAT 5 PORTE COMFORT - 9/2000",
"CORSA 1.7 16V DTI CAT 5 PORTE EDITION - 1/2003",
"CORSA 1.7 16V DTI CAT 5 PORTE ELEGANCE - 9/2000"]


["Focus 1.6i 16V cat SW Ghia",
"Focus 1.6i 16V cat SW Zetec",
"Focus 1.6i 16V cat 3p. Zetec",
"Focus 1.6i 16V cat 5p. Ghia",
"Focus 1.6i 16V cat 5p. Zetec",
"Focus 1.8 TDCi (100CV) cat SW Zetec",
"Focus 1.8 TDCi (100CV) cat 3p. Zetec",
"Focus 1.8 TDCi (100CV) cat 5p. Zetec",
"Focus 1.8 TDCi (115CV) cat SW Ghia",
"Focus 1.8 TDCi (115CV) cat SW Zetec",
"Focus 1.8 TDCi (115CV) cat 3p. Zetec",
"Focus 1.8 TDCi (115CV) cat 5p. Ghia",
"Focus 1.8 TDCi (115CV) cat 5p. Zetec",
"Focus 1.8i 16V cat SW Ghia",
"Focus 1.8i 16V cat SW Zetec",
"Focus 1.8i 16V cat 3p. Zetec",
"Focus 1.8i 16V cat 5p. Ghia",
"Focus 1.8i 16V cat 5p. Zetec",
"Focus 2.0i 16V cat SW Ghia",
"Focus 2.0i 16V cat SW ST170",
"Focus 2.0i 16V cat SW Zetec",
"Focus 2.0i 16V cat 3p. RS215",
"Focus 2.0i 16V cat 3p. ST170",
"Focus 2.0i 16V cat 3p. Zetec",
"Focus 2.0i 16V cat 5p. Ghia",
"Focus 2.0i 16V cat 5p. ST170",
"Focus 2.0i 16V cat 5p. Zetec"]



comboConte =["Focus 1.6i 16V cat SW Ambiente",
"Focus 1.6i 16V cat SW Ghia",
"Focus 1.6i 16V cat SW Zetec",
"Focus 1.6i 16V cat 3p. Ambiente",
"Focus 1.6i 16V cat 3p. Zetec",
"Focus 1.6i 16V cat 5p. Ambiente",
"Focus 1.6i 16V cat 5p. Ghia",
"Focus 1.6i 16V cat 5p. Zetec",
"Focus 1.8 TDCi (100CV) cat SW Ambiente",
"Focus 1.8 TDCi (100CV) cat 3p. Ambiente",
"Focus 1.8 TDCi (100CV) cat 5p. Ambiente",
"Focus 1.8 TDCi (115CV) cat SW Ghia",
"Focus 1.8 TDCi (115CV) cat SW Zetec",
"Focus 1.8 TDCi (115CV) cat 3p. Zetec",
"Focus 1.8 TDCi (115CV) cat 5p. Ghia",
"Focus 1.8 TDCi (115CV) cat 5p. Zetec",
"Focus 1.8i 16V cat SW Ghia",
"Focus 1.8i 16V cat SW Zetec",
"Focus 1.8i 16V cat 3p. Zetec",
"Focus 1.8i 16V cat 5p. Ghia",
"Focus 1.8i 16V cat 5p. Zetec",
"Focus 2.0i 16V cat SW Ghia",
"Focus 2.0i 16V cat SW ST170",
"Focus 2.0i 16V cat SW Zetec",
"Focus 2.0i 16V cat 3p. RS215",
"Focus 2.0i 16V cat 3p. ST170",
"Focus 2.0i 16V cat 3p. Zetec",
"Focus 2.0i 16V cat 5p. Ghia",
"Focus 2.0i 16V cat 5p. ST170",
"Focus 2.0i 16V cat 5p. Zetec"]


match(comboConte,"Focs 1.x  TDCi 1s0CV cat 5p. Ambiente").sort {|a, b|
  if a[1] == b[1]
    (a[2] <=> b[2])
  else
    (-a[1] <=> -b[1])
  end}.each {|element|
   element.map!{ |item| " #{item}  "}
  puts "#{element}"
}


dist = similar( "OPEL ASTRA 1 -2008 ", "CORSA 1.4I 16V CAT 5 PORTE SPORT (08/2003)")

distanza= Text::Levenshtein.distance("rosa","rose")
distanza= Text::Levenshtein.distance("rosette","rosdadadase")

#puts "#{dist}"


