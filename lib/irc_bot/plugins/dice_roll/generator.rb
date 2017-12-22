module IRCBot
  module Plugins
    module DiceRoll
      ##
      # Generator for the DiceRoll plugin.
      class Generator

        ##
        # Default maximum sides of the die.
        #
        # @see validate_sides
        MAX_SIDES = 100

        ##
        # Default maximum dice to roll.
        #
        # @see validate_rolls
        MAX_ROLLS = 100

        attr_reader :sides, :rolls, :modifier

        def initialize(message, sides:, rolls:, modifier:)
          @message = message
          @sides = validate_sides(sides)
          @rolls = validate_rolls(rolls)
          @modifier = modifier
        end

        ##
        # Actually build the list of dice
        def run
          @values ||= build_roll
          nil
        end

        ##
        # Gets the total of the dice rolled, modifier excluded.
        #
        # @return [Integer, nil] Sum of the dice, `nil` if {#run} hasn't been called yet.
        def raw_total
          return nil unless values
          values.reduce(0, :+)
        end

        ##
        # Gets the total of the dice rolled, modifier  included.
        #
        # @return [Integer, nil] Sum of the dice, `nil` if {#run} hasn't been called yet.
        def total
          return nil unless values
          raw_total + modifier
        end

        ##
        # Gets the dice rolled, as a list.
        #
        # @return [Array<Integer>] Sum of the dice, `nil` if {#run} hasn't been called yet.
        def dice
          values
        end

        private

        attr_reader :message, :values

        def build_roll
          dice = []
          rolls.times do
            dice << rand(sides) + 1
          end
          dice
        end

        def validate_sides(sides, default=6)
          if sides <= 0
            message.reply "Rolling a d#{sides} won't do. Assuming #{default}."
            return default
          end
          if sides > MAX_SIDES
            message.reply "Rolling a d#{sides} won't do. Assuming #{MAX_SIDES}."
            return MAX_SIDES
          end
          return sides
        end

        def validate_rolls(rolls, default=1)
          if rolls <= 0
            message.reply "Rolling #{rolls} dice won't do. Assuming #{default}."
            return default
          end
          if rolls > MAX_ROLLS
            message.reply "Rolling #{rolls} dice won't do. Assuming #{MAX_ROLLS}."
            return MAX_ROLLS
          end
          return rolls
        end
      end
    end
  end
end
