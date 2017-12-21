module IRCBot
  module Plugins
    module Wiktionary
      ##
      # A plugin that fetches a random word from wiktionary.
      #
      # *Syntax*
      #
      #     !word
      class Plugin
        include Cinch::Plugin

        match 'word'

        ##
        # Replies to any message matching the plugin's pattern.
        #
        # @param message
        def execute(message)
          word = ''
          loop do
            word = generator.generate
            break if word.ascii_only?
            message.reply 'Non-ASCII word received... Retrying...'
          end
          message.reply word
        end

        private

        attr_reader :wiktionary, :bot

        def generator
          @generator ||= Generator.new
        end
      end
    end
  end
end
