module IRCBot
  module DiceRoll
    class Generator
      def roll(sides:)
        rand(sides) + 1
      end
    end
  end
end

