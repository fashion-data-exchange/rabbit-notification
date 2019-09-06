module FDE
  module Rabbit
    class Message
      attr_accessor :conneciton,
        :channel,
        :exchange,
        :name,
        :payload

      def initialize(payload, exchange_name)
        @payload = payload
        @name = exchange_name
      end

      def deliver(key)
        start
        exchange.publish(payload, routing_key: key)
      end

      def connection
        @connection ||= Connection.new
      end

      def channel
        @channel ||= connection.create_channel
      end

      def exchange
        @exchange ||= Bunny::Exchange.new(
          channel, :topic, @name, durable: true
        )
      end

      def start
        connection.start
      end

      def close
        connection.close
      end

    end
  end
end
