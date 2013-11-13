require "spec_helper"

describe "influxdb::ruby" do
  it { should include_class "influxdb::params" }

  it { should have_resource_count(1) }
  it { should have_package_resource_count(1) }

  it { should contain_package("influxdb_ruby").
              with_ensure("present").
              with_name("influxdb").
              with_provider("gem") }

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should contain_package("influxdb_ruby").with_ensure("absent") }
  end
end
