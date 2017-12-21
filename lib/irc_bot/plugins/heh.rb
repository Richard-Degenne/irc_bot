require_relative 'heh/generator'
require_relative 'heh/plugin'

module IRCBot
  module Plugins
    module Heh
    end

    register(Heh::Plugin)
  end
end

