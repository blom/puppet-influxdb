require "spec_helper"

describe Puppet::Type.type(:influxdb_cluster_admin).provider(:default) do
  let(:username) { "foobar" }
  let(:password) { "foobar123" }

  let(:provider) { described_class.new(resource) }
  let(:resource) {
    Puppet::Type::Influxdb_cluster_admin.new(
      :username => username,
      :password => password
    )
  }

  describe "#create" do
    it "creates a cluster admin" do
      InfluxDB::Client.any_instance.should_receive(:create_cluster_admin).
                       with(username, password)
      provider.create
    end
  end

  describe "#destroy" do
    it "destroys a cluster admin" do
      InfluxDB::Client.any_instance.should_receive(:delete_cluster_admin).
                       with(username)
      provider.destroy
    end
  end

  describe "#exists?" do
    it "returns true when a cluster admin exists" do
      InfluxDB::Client.any_instance.stub(:get_cluster_admin_list).
                       and_return([{"username" => username}])
      provider.stub(:resource).and_return({"username" => username})
      provider.exists?.should be_true
    end

    it "returns false when a cluster admin does not exist" do
      InfluxDB::Client.any_instance.stub(:get_cluster_admin_list).
                       and_return([{"username" => "xyz"}])
      provider.stub(:resource).and_return({"username" => username})
      provider.exists?.should be_false
    end
  end
end
