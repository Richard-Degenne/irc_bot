module IRCBot
  ##
  # This module contains well-needed auxiliary utilites.
  module Utils

  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'utils', '*.rb')).each do |file|
  require file
end

