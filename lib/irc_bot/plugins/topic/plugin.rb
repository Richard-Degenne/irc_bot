module IRCBot
  module Plugins
    module Topic
      ##
      # A plugin that changes the topic with motivational quotes.
      #
      # *Syntax*
      #
      #     !topic
      class Plugin
        include Cinch::Plugin

        match 'topic'

        ##
        # Replies to any message matching the plugin's pattern.
        #
        # @param message
        def execute(message)
          q.first.send("SETTOPIC #{message.channel} #{generator.generate}")
        end

        class << self
          def syntax
            '!topic'
          end

          def description
            'Sets a motivational quote as the topic'
          end
        end

        private

        attr_reader :topic, :bot

        def generator
          @generator ||= Generator.new
        end

        def q
          @q ||= bot.channels.first.users.detect {|user, modes| user.nick=='Q'}
        end
      end
    end
  end
end
