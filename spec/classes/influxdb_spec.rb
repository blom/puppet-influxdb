require "spec_helper"

describe "influxdb" do
  it { should include_class "influxdb::params" }
end
