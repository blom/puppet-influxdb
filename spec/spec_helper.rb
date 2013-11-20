if ENV["SIMPLECOV"]
  require "simplecov"
  SimpleCov.start { add_filter "/spec/" }
elsif ENV["TRAVIS"] && RUBY_VERSION.to_f >= 1.9
  require "coveralls"
  Coveralls.wear! { add_filter "/spec/" }
end

require "rspec-puppet"
require "webmock/rspec"

fixture_path = File.expand_path("../fixtures", __FILE__)

RSpec.configure do |config|
  config.manifest_dir = File.join(fixture_path, "manifests")
  config.module_path  = File.join(fixture_path, "modules")
  config.order        = :random
end
