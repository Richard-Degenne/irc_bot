module IRCBot
  ##
  # This module contains uitilites for the Heh plugin.
  module Heh

  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'heh', '*.rb')).each do |file|
  require file
end

