require "rake/clean"
require "rspec/core/rake_task"
require "puppet-lint/tasks/puppet-lint"
require "yard"

CLOBBER.include %w(.yardoc coverage doc pkg)
task :default => [:spec, :lint]

desc "Generate coverage data"
task :coverage do
  ENV["SIMPLECOV"] = ""
  Rake::Task["spec"].invoke
end

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/**/*_spec.rb"
end

YARD::Rake::YardocTask.new do |t|
end
