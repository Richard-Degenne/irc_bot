module IRCBot
  module Plugins
    module DiceRoll
      ##
      # A plugin that rolls dice.
      #
      # *Syntax*
      #
      #     !roll [<rolls>]d<sides>[<+-><offset>]
      #
      # `rolls`: Number of dice to roll. Must be between 1 and 100.
      # `sides`: Type of die to roll. Must be between 1 and 100.
      class Plugin
        include Cinch::Plugin

        match /roll ([+-]?\d+)?d([+-]?\d+)(\s*[+-]\s*\d+)?/

        ##
        # Replies to any message matching the plugin's pattern.
        #
        # @param message
        def execute(message, rolls, sides, modifier)
          dice_roll = Generator.new(
            message,
            sides: sides.to_i,
            rolls: rolls.to_i,
            modifier: (modifier ? modifier.delete(' ').to_i : 0)
          )

          dice_roll.run

          print_total(message, dice_roll)
          print_dice(message, dice_roll)
        end

        private

        def print_total(message, dice_roll)
          if dice_roll.modifier == 0
            message.reply dice_roll.total
          else
            message.reply "#{dice_roll.total} (#{dice_roll.raw_total}#{sprintf("%+d", dice_roll.modifier)})"
          end
        end

        def print_dice(message, dice_roll)
          if dice_roll.rolls > 1
            message.reply dice_roll.dice
          end
        end
      end
    end
  end
end
