require 'celluloid/autostart'

module Wisper
  module Celluloid
    class CelluloidBroadcaster
      def broadcast(subscriber, publisher, event, args)
        Wrapper.new(subscriber).async.broadcast(event, *args)
      end

      class Wrapper
        include ::Celluloid

        def initialize(subscriber)
          @subscriber = subscriber
        end

        def broadcast(event, *args)
          @subscriber.public_send(event, *args)
          terminate
        end
      end
    end
  end
end
