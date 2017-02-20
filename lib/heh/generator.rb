module IRCBot
  module Heh
    ##
    # Generates words for the Heh plugin.
    class Generator
      ##
      # A list of all English consonants.
      CONSONSANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
      
      ##
      # Generates a new word.
      #
      # @return [String] The generated word
      def generate
        consonant = CONSONSANTS.sample
        "#{prefixes.sample}#{consonant}e#{consonant}"
      end

      private

      def prefixes
        @prefixes ||= load_prefixes
      end

      def load_prefixes
        Dir.glob(File.join(File.dirname(__FILE__), '*.txt')).each_with_object([]) do |file, memo|
          File.open(file, "r") do |io|
            io.each_line do |line|
              memo << line.chomp
            end
          end
        end
      end
    end
  end
end
