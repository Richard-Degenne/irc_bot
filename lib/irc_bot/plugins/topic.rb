module IRCBot
  module Plugins
    ##
    # A plugin that changes the topic with motivational quotes.
    #
    # *Syntax*
    #
    #     !topic
    class Topic
      include Cinch::Plugin

      match 'topic'

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message)
        q.first.send("SETTOPIC #{message.channel} #{topic.generate}")
      end

      private

      attr_reader :topic, :bot

      def topic
        @topic ||= IRCBot::Topic::Generator.new
      end

      def q
        @q ||= bot.channels.first.users.detect {|user, modes| user.nick=='Q'}
      end
    end

    register(Topic)
  end
end

