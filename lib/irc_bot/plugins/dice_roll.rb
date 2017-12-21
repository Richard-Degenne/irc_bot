require_relative 'dice_roll/generator'
require_relative 'dice_roll/plugin'

module IRCBot
  module Plugins
    module DiceRoll
    end

    register(DiceRoll::Plugin)
  end
end

