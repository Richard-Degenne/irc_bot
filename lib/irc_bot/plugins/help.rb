module IRCBot
  module Plugins
    ##
    # A meta-plugin that displays available commands.
    #
    # *Syntax*
    #
    #     !help
    class Help
      include Cinch::Plugin

      match 'help'

      ##
      # Replies to any message matching the plugin's pattern.
      #
      # @param message
      def execute(message)
        message.reply help_message
      end

      private

      def help_message
        String.new.tap do |message|
          message << "Here are the available plugins:\n"
          Plugins.all.each do |plugin|
            message << "- #{plugin.name}\n"
          end
          message << "End of the list."
        end
      end
    end

    register(Help)
  end
end
