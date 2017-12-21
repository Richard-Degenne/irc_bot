module IRCBot
  module Plugins
    module Heh
      ##
      # A plugin that generates random words.
      #
      # *Syntax*
      #
      #     !heh
      class Plugin
        include Cinch::Plugin

        match /([b-df-hj-np-tv-z])e\1\z/

        ##
        # Replies to any message matching the plugin's pattern.
        #
        # @param message
        def execute(message)
          message.reply generator.generate
        end

        private

        def generator
          @generator ||= Generator.new
        end
      end
    end
  end
end
