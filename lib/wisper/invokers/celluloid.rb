require 'celluloid/autostart'

module Wisper
  module Invokers
    class Celluloid
      def invoke(listener, _, method_to_call, args)
        Wrapper.new(listener).async.public_send(method_to_call, *args)
      end

      class Wrapper

        include ::Celluloid

        attr_reader :listener

        def initialize(listener)
          @listener = listener
        end

        def method_missing(method, *args, &block)
          listener.public_send(method, *args, &block)
          # terminate
        end
      end
    end
  end
end
