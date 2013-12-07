require "spec_helper"

describe "influxdb::server" do
  let(:facts) { {:architecture => 'x86_64'} }

  it { should contain_class "influxdb::params" }

  it { should have_resource_count(2) }
  it { should have_package_resource_count(1) }
  it { should have_service_resource_count(1) }

  it { should contain_package("influxdb").
              with_ensure("present").
              with_source(/x86_64\.rpm\z/).
              with_provider("rpm") }

  it { should contain_service("influxdb").
              without_ensure.
              with_enable(true).
              with_hasrestart(true).
              with_require(/\APackage\[influxdb\]/) }

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should contain_package("influxdb").with_ensure("absent") }
  end

  context "when service_enable is 'false'" do
    let(:params) { {:service_enable => false} }
    it { should contain_service("influxdb").with_enable(false) }
  end

  context "when service_ensure is 'running'" do
    let(:params) { {:service_ensure => "running"} }
    it { should contain_service("influxdb").with_ensure("running") }
  end

  context "when architecture is 'i386'" do
    let(:facts) { {:architecture => 'i386'} }
    it { should contain_package("influxdb").with_source(/i686\.rpm\z/) }
  end
end
