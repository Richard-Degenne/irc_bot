module IRCBot
  ##
  # This class represents the bot itself.
  class Bot
    def initialize
      @bot = Cinch::Bot.new do
        configure do |c|
          c.server = 'euroserv.fr.quakenet.org'
          c.channels = ['#troswag']

          c.plugins.plugins = Plugins.all
        end
      end
    end

    ##
    # Runs the bot.
    #
    # It will connect to the configured server and channels, with all available
    # plugins loaded and will start listening for commands.
    def run
      bot.start
    end

    private

    attr_reader :bot
  end
end