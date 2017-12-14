module IRCBot
  module Plugins
    ##
    # A plugin that generates random words.
    #
    # *Syntax*
    #
    #     !heh
    class Heh
      include Cinch::Plugin

      match /([b-df-hj-np-tv-z])e\1\z/

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message)
        message.reply heh.generate
      end

      private

      attr_reader :heh, :bot

      def heh
        @heh ||= IRCBot::Heh::Generator.new
      end
    end

    register(Heh)
  end
end

