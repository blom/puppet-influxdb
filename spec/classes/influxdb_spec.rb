require "spec_helper"

describe "influxdb" do
  it { should include_class "influxdb::params" }
  it { should have_resource_count(0) }
end
