require 'cinch'
require 'cinch/plugins/identify'
require 'net/http'
require 'json'

##
# Main namespace for the application.
module IRCBot
end

require_relative 'irc_bot/utils'

require_relative 'irc_bot/bot'
require_relative 'irc_bot/plugins'
