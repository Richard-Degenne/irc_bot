module IRCBot
  ##
  # This module contains all Cinch plugins for the bot.
  #
  # It uses the Registry patterns to dynamically load all available plugins.
  module Plugins
    class << self
      attr_reader :registry

      ##
      # Fetches all registered plugins.
      #
      # @return [Array<Class>]
      #
      # @see Utils::PluginRegistry#all
      def all
        registry.all
      end

      ##
      # Registers a new plugin.
      #
      # @param klass [Class] The new plugin's class
      def register(klass)
        registry.register(klass)
      end

      ##
      # Module configuration.
      #
      # Must be called before any plugin registry access.
      def configure_module
        @registry = IRCBot::Utils::PluginRegistry.new
      end
    end
  end
end

IRCBot::Plugins.configure_module

Dir.glob(File.join(File.dirname(__FILE__), 'plugins', '*.rb')).each do |file|
  require file
end

