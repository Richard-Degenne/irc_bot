module IRCBot
  module Plugins
    ##
    # A plugin that rolls dice.
    #
    # *Syntax*
    #
    #     !roll d<sides>
    class DiceRoll
      include Cinch::Plugin

      match /roll d([+-]?\d+)/

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message, sides)
        sides = sides.to_i
        if sides <= 0
          message.reply("Don't make me roll impossible dice!")
          return
        end
        message.reply dice_roll.roll(
          sides: sides.to_i
        )
      end

      private

      attr_reader :dice_roll

      def dice_roll
        @dice_roll ||= IRCBot::DiceRoll::Generator.new
      end
    end

    register(DiceRoll)
  end
end

