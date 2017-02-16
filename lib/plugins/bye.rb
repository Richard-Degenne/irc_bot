module IRCBot
  module Plugins
    class Bye
      include Cinch::Plugin

      match 'bye'

      def execute(message)
        message.reply "Bye #{message.user.nick}!"
      end
    end

    register(Bye)
  end
end

