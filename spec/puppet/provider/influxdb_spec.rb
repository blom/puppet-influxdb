require "spec_helper"

describe Puppet::Provider::InfluxDB do
  let(:influxdb) { described_class.new }
  before { influxdb.stub(:resource).and_return({}) }

  describe "#influxdb" do
    it { influxdb.influxdb.should be_a InfluxDB::Client }
  end

  describe "#config" do
    it "returns a hash with keys converted to symbols" do
      influxdb.stub(:resource).and_return "config" => { "foo" => 0 }
      influxdb.send(:config).should eql :foo => 0
    end
  end
end
