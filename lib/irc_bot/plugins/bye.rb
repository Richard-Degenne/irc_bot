module IRCBot
  module Plugins
    ##
    # A plugin that says bye!
    #
    # *Syntax*
    #
    #     !bye
    class Bye
      include Cinch::Plugin

      match 'bye'

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message)
        message.reply "Bye #{message.user.nick}!"
      end

      class << self
        def syntax
          '!bye'
        end

        def description
          'Says bye to you'
        end
      end
    end

    register(Bye)
  end
end

