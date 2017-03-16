module IRCBot
  ##
  # This module contains uitilites for the Topic plugin.
  module Topic

  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'topic', '*.rb')).each do |file|
  require file
end

