module Taper class Executable

  def initialize args
    Trollop.options
    Trollop.die 'no file given'       if     args.empty?
    Trollop.die 'file does not exist' unless File.exists? args.first
  end

end end
