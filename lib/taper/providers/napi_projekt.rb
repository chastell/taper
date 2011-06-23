module Taper module Providers::NapiProjekt

  extend self

  def subtitles_for hash
    url_for hash
  end

  private

  # courtesy of sites.google.com/site/napipy
  def magic_for hash
    [[14,0,2], [3,13,2], [6,16,5], [8,11,4], [2,5,3]].map do |a, b, c|
      from = hash[a].to_i(16) + b
      (hash[from, 2].to_i(16) * c).to_s(16)[-1]
    end.join
  end

  # courtesy of sites.google.com/site/napipy
  def url_for hash
    "http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=#{hash}&t=#{magic_for hash}&v=other"
  end

end end
