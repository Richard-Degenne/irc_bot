module IRCBot
  module Wiktionary
    ##
    # Generates words for the Wiktionary plugin.
    class Generator
      ##
      # URL of Wiktionary's special random page.
      WIKTIONARY_RANDOM_URL = URI('https://en.wiktionary.org/wiki/Special:Random')
      
      ##
      # Generates a new word.
      #
      # @return [String] The generated word
      def generate
        response = Net::HTTP.get_response(WIKTIONARY_RANDOM_URL)
        fail StandardError unless response.is_a? Net::HTTPRedirection
        parse_response(response)
      end

      private

      def parse_response(response)
        URI.decode(response['location'].split('/').last)
      end
    end
  end
end
