module FDE
  module Rabbit
    module Notification

      class Message
        attr_accessor :conneciton,
          :channel,
          :exchange,
          :name

        def initialize(exchange_name)
          @name = exchange_name
        end

        def send(message, key)
          start
          exchange.publish(message, routing_key: key)
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
end
