require "rabbit/notification/version"
require "rabbit/notification/message"
require "rabbit/notification/connection"
require 'bunny'
require 'json'

module FDE
  module Rabbit
    module Notification
      class Config
        attr_accessor :host,
          :port,
          :ssl,
          :vhost,
          :user,
          :password,
          :hartbeat,
          :frame_max
      end

      def self.config
        @@config ||= Config.new
      end

      def self.configure
        yield self.config
      end
    end
  end
end
