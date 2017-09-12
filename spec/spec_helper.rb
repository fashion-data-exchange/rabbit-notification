require "bundler/setup"
require "rabbit/notification"
require 'dotenv'
require 'pry'

Dotenv.load('.test.env')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end

FDE::Rabbit::Notification.configure do |config|
  config.host = ENV.fetch('RABBIT_HOST')
  config.vhost = ENV.fetch('RABBIT_VHOST')
  config.user = ENV.fetch('RABBIT_USER')
  config.password = ENV.fetch('RABBIT_PASSWORD')
end

