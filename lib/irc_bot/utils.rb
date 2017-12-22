module IRCBot
end

Dir.glob(File.join(File.dirname(__FILE__), 'utils', '*.rb')).each do |file|
  require file
end
