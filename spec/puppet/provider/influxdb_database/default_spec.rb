require "spec_helper"

describe Puppet::Type.type(:influxdb_database).provider(:default) do
  let(:database) { "foobar" }
  let(:resource) { Puppet::Type::Influxdb_database.new :name => database }
  let(:provider) { described_class.new(resource) }

  describe "#create" do
    it "creates a database" do
      InfluxDB::Client.any_instance.
                       should_receive(:create_database).with(database, {})
      provider.create
    end

    context "when replication_factor is set to 3" do
      it "creates a database with replicationFactor set to 3" do
        InfluxDB::Client.any_instance.
                         should_receive(:create_database).
                         with(database, "replicationFactor" => 3)
        provider.stub(:resource).
                 and_return("name" => database, "replication_factor" => 3)
        provider.create
      end
    end
  end

  describe "#destroy" do
    it "destroys a database" do
      InfluxDB::Client.any_instance.
                       should_receive(:delete_database).with(database)
      provider.destroy
    end
  end

  describe "#exists?" do
    it "returns true when a database exists" do
      InfluxDB::Client.any_instance.stub(:get_database_list).
                       and_return([{"name" => database}])
      provider.stub(:resource).and_return({"name" => database})
      provider.exists?.should be_true
    end

    it "returns false when a database does not exist" do
      InfluxDB::Client.any_instance.stub(:get_database_list).
                       and_return([{"name" => "foo"}])
      provider.stub(:resource).and_return({"name" => database})
      provider.exists?.should be_false
    end
  end
end
