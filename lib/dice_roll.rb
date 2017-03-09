module IRCBot
  ##
  # This module contains uitilites for the DiceRoll plugin.
  module DiceRoll

  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'dice_roll', '*.rb')).each do |file|
  require file
end

