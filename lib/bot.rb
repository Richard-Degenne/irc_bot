module IRCBot
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

    def run
      bot.start
    end

    private

    attr_reader :bot
  end
end
