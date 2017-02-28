module IRCBot
  module DiceRoll
    class Generator

      MAX_SIDES = 100
      MAX_ROLLS = 100

      def initialize(message, sides:, rolls:)
        @message = message
        @sides = sides
        @rolls = rolls
      end

      def run
        @values ||= build_roll
        nil
      end

      def total
        return nil unless values
        values.reduce(0, :+)
      end

      def dice
        values
      end

      private

      attr_reader :message, :sides, :rolls, :values

      def build_roll
        effective_sides = validate_sides(sides)
        effective_rolls = validate_rolls(rolls)

        dice = []
        effective_rolls.times do
          dice << rand(effective_sides) + 1
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

