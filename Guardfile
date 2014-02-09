guard :rspec do
  watch(%r{^spec/.+_spec\.rb})
  watch("spec/spec_helper.rb") { "spec" }
  watch(%r{^lib/(.+)\.rb}) { |_, m| "spec/#{m}_spec.rb" }
  watch(%r{^manifests/(.+)\.pp}) { |_, m| "spec/classes/#{m}_spec.rb" }
end

guard :shell do
  watch(%r{manifests/.+\.pp}) do |f, _|
    command = "puppet-lint #{f}"
    UI.info "Running: #{command}"
    system command
  end
end
