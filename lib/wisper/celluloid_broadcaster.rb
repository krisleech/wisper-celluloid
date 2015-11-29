require 'celluloid/current'

module Wisper
  class CelluloidBroadcaster
    def broadcast(subscriber, publisher, event, args)
      Wrapper.new(subscriber).async.broadcast(event, args)
    end

    class Wrapper
      include ::Celluloid

      def initialize(subscriber)
        @subscriber = subscriber
      end

      def broadcast(event, args)
        @subscriber.public_send(event, *args)
        terminate
      end
    end

    def self.register
      Wisper.configure do |config|
        config.broadcaster :celluloid, CelluloidBroadcaster.new
        config.broadcaster :async,     CelluloidBroadcaster.new
      end
    end
  end
end

Wisper::CelluloidBroadcaster.register
