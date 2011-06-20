require 'trollop'

module Taper

  autoload :Executable, 'taper/executable'

  module Providers
    autoload :NapiProjekt, 'taper/providers/napi_projekt'
  end

end
