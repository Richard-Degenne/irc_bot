require_relative 'wiktionary/generator'
require_relative 'wiktionary/plugin'

module IRCBot
  module Plugins
    module Wiktionary
    end

    register(Wiktionary::Plugin)
  end
end

