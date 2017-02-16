module IRCBot
  module Utils
    class PluginRegistry
      def initialize
        @registry = []
      end

      def register(klass)
        fail ArgumentError, "#{klass} is not a Class." unless klass.is_a? Class
        fail ArgumentError, "#{klass} is already registered." if registry.include? klass

        registry << klass
      end

      def all
        registry
      end

      private

      attr_reader :registry
    end
  end
end
