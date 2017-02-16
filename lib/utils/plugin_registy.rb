module IRCBot
  module Utils
    ##
    # This is an implementation of the Registry pattern for plugins.
    class PluginRegistry
      def initialize
        @registry = []
      end

      ##
      # Registers a new plugin.
      #
      # @param klass [Class] The plugin's class.
      #
      # @raise [ArgumentError] If `klass` is not a class or if it is already
      #   registered.
      def register(klass)
        fail ArgumentError, "#{klass} is not a Class." unless klass.is_a? Class
        fail ArgumentError, "#{klass} is already registered." if registry.include? klass

        registry << klass
      end

      ##
      # Fetches all registered plugins.
      #
      # @return [Array<Class>]
      def all
        registry
      end

      private

      attr_reader :registry
    end
  end
end
