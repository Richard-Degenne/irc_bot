require_relative 'topic/generator'
require_relative 'topic/plugin'

module IRCBot
  module Plugins
    module Topic
    end

    register(Topic::Plugin)
  end
end

