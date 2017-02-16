module IRCBot
  module Plugins
    class << self
      attr_reader :registry

      def all
        registry.all
      end

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

