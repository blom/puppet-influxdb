require "rake/clean"
require "rspec/core/rake_task"
require "puppet-lint/tasks/puppet-lint"

CLOBBER.include %w(.yardoc doc pkg)
task :default => [:spec, :lint]

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/**/*_spec.rb"
end
