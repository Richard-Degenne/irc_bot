module IRCBot
  module Plugins
    ##
    # A plugin that fetches a random word from wiktionary.
    #
    # *Syntax*
    #
    #     !word
    class Wiktionary
      include Cinch::Plugin

      match 'word'

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message)
        message.reply wiktionary.generate
      end

      private

      attr_reader :wiktionary, :bot

      def wiktionary
        @wiktionary ||= IRCBot::Wiktionary::Generator.new
      end
    end

    register(Wiktionary)
  end
end

