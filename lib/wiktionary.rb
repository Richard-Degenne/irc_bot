module IRCBot
  ##
  # This module contains uitilites for the Wiktionary plugin.
  module Wiktionary

  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'wiktionary', '*.rb')).each do |file|
  require file
end

