module IRCBot
  module Plugins
    ##
    # A plugin that says hello!
    #
    # *Syntax*
    #
    #     !hello
    class Hello
      include Cinch::Plugin

      match 'hello'

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message)
        message.reply "Hello #{message.user.nick}!"
      end

      class << self
        def syntax
          '!hello'
        end

        def description
          'Says hello to you'
        end
      end
    end

    register(Hello)
  end
end

