module IRCBot
  module Plugins
    ##
    # A plugin that rolls dice.
    #
    # *Syntax*
    #
    #     !roll <rolls>d<sides>
    #
    # `rolls`: Number of dice to roll. Must be between 1 and 100.
    # `sides`: Type of die to roll. Must be between 1 and 100.
    class DiceRoll
      include Cinch::Plugin

      match /roll ([+-]?\d+)?d([+-]?\d+)/

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message, rolls, sides)
        dice_roll = IRCBot::DiceRoll::Generator.new(message,
          sides: sides.to_i,
          rolls: rolls.to_i
        )
        
        dice_roll.run

        message.reply dice_roll.total

        if rolls.to_i > 1
          message.reply dice_roll.dice
        end
      end
    end

    register(DiceRoll)
  end
end

