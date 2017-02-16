module IRCBot
  module Plugins
    class Hello
      include Cinch::Plugin

      match 'hello'

      def execute(message)
        message.reply "Hello #{message.user.nick}!"
      end
    end

    register(Hello)
  end
end

