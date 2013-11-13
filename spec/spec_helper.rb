require "rspec-puppet"

fixture_path = File.expand_path("../fixtures", __FILE__)

RSpec.configure do |config|
  config.manifest_dir = File.join(fixture_path, "manifests")
  config.module_path  = File.join(fixture_path, "modules")
  config.order        = :random
end
