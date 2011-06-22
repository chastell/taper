module Taper module Providers::NapiProjekt

  extend self

  # courtesy of sites.google.com/site/napipy
  # FIXME: privatise
  def url_for hex
    "http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=#{hex}&t=#{magic hex}&v=other&kolejka=false&nick=&pass=&napios=posix"
  end

  private

  # courtesy of sites.google.com/site/napipy
  def magic hex
    [[14,0,2], [3,13,2], [6,16,5], [8,11,4], [2,5,3]].map do |a, b, c|
      from = hex[a].to_i(16) + b
      (hex[from, 2].to_i(16) * c).to_s(16)[-1]
    end.join
  end

end end
