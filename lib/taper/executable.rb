module Taper class Executable

  def initialize args
    Trollop.options
    Trollop.die 'no file given'       if     args.empty?
    Trollop.die 'file does not exist' unless File.exists? args.first
    @movie = args.first
  end

  def run args
    args[:output].puts args[:provider].subtitles_for @movie
  end

end end
