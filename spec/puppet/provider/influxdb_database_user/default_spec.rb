require "spec_helper"

describe Puppet::Type.type(:influxdb_database_user).provider(:default) do
  let(:username) { "foobar" }
  let(:password) { "foobar123" }
  let(:database) { "some_database" }

  let(:provider) { described_class.new(resource) }
  let(:resource) {
    Puppet::Type::Influxdb_database_user.new(
      :username => username,
      :password => password,
      :database => database
    )
  }

  describe "#create" do
    it "creates a database user" do
      InfluxDB::Client.any_instance.should_receive(:create_database_user).
                       with(database, username, password)
      provider.create
    end
  end

  describe "#destroy" do
    it "destroys a database user" do
      InfluxDB::Client.any_instance.should_receive(:delete_database_user).
                       with(database, username)
      provider.destroy
    end
  end

  describe "#exists?" do
    it "returns true when a database user exists" do
      InfluxDB::Client.any_instance.stub(:get_database_user_list).
                       and_return([{"name" => username}])
      provider.stub(:resource).and_return({"username" => username})
      provider.exists?.should be_true
    end

    it "returns false when a database user does not exist" do
      InfluxDB::Client.any_instance.stub(:get_database_user_list).
                       and_return([{"name" => "xyz"}])
      provider.stub(:resource).and_return({"username" => username})
      provider.exists?.should be_false
    end
  end
end
