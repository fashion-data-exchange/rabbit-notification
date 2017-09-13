require 'bunny'

module FDE
  module Rabbit
    module Connection
      include Bunny

      def self.new
        Bunny.new(
          host: (FDE::Rabbit::Notification.config.host || '127.0.0.1'),
          port: (FDE::Rabbit::Notification.config.port || 5672),
          ssl: (FDE::Rabbit::Notification.config.ssl || false),
          vhost: (FDE::Rabbit::Notification.config.vhost || '/'),
          user: (FDE::Rabbit::Notification.config.user || 'guest'),
          password: (FDE::Rabbit::Notification.config.password || 'guest'),
          hartbeat: (FDE::Rabbit::Notification.config.hartbeat || :server),
          frame_max: (FDE::Rabbit::Notification.config.frame_max || 131072)
        )
      end

    end
  end
end
