module IRCBot
  module Plugins
    module Topic
      ##
      # Generates quotes for the Quote plugin.
      class Generator
        ##
        # API's URL
        FORISMATIC_URL = URI("http://api.forismatic.com/api/1.0/?method=getQuote&format=json&key=#{rand(1_000_000)}&lang=en")

        ##
        # Generates a new quote.
        #
        # @return [String] The generated quote
        def generate
          response = Net::HTTP.get_response(FORISMATIC_URL)
          fail StandardError unless response.is_a? Net::HTTPOK
          parse_response(response)
        end

        private

        def parse_response(response)
          json = JSON(response.body)
          "\"#{json['quoteText']}\" -- #{json['quoteAuthor']}"
        end
      end
    end
  end
end
