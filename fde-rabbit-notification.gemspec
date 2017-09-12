# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rabbit/notification/version"

Gem::Specification.new do |spec|
  spec.name          = "rabbit-notification"
  spec.version       = FDE::Rabbit::Notification::VERSION
  spec.authors       = ["Felix Langenegger"]
  spec.email         = ["f.langenegger@fadendaten.ch"]

  spec.summary       = %q{Send a Message to the Queue}
  spec.description   = %q{Send a message to the rabbitmq message queue system}
  spec.homepage      = "https://github.com/fashion-data-exchange/rabbit-notification"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'bunny', '~> 2.7'
  spec.add_runtime_dependency "dotenv", "~> 2.2", ">= 2.2.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-remote", "~> 0.1"
  spec.add_development_dependency "pry-nav", "~> 0.2"
end
