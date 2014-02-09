require "spec_helper"

describe "influxdb::ruby" do
  let(:exec_conditional) { 'gem list influxdb | egrep -q "^influxdb "'}

  it { should contain_class "influxdb::params" }

  it { should have_resource_count(1) }
  it { should have_exec_resource_count(1) }

  it { should contain_exec("install influxdb gem").
              with_command("gem install influxdb").
              with_unless(exec_conditional) }

  it { should_not contain_exec("uninstall influxdb gem") }

  context "when package_ensure is 'installed'" do
    let(:params) { {:package_ensure => "installed"} }
    it { should contain_exec("install influxdb gem") }
    it { should_not contain_exec("uninstall influxdb gem") }
  end

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should_not contain_exec("install influxdb gem") }
    it { should contain_exec("uninstall influxdb gem") }
  end

  context "when package_ensure is 'latest'" do
    let(:params) { {:package_ensure => "latest"} }
    specify { expect { subject }.
              to raise_error(Puppet::Error, /\AInvalid value/) }
  end
end
