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

      class << self
        def syntax
          '!help'
        end

        def description
          'Displays a list of available commands'
        end
      end

      private

      def help_message
        String.new.tap do |message|
          message << "Here are the available plugins:\n"
          Plugins.all.each do |plugin|
            if plugin.respond_to?(:syntax) && plugin.respond_to?(:description)
              message << "- #{plugin.syntax} : #{plugin.description}\n"
            end
          end
          message << "End of the list."
        end
      end
    end

    register(Help)
  end
end
