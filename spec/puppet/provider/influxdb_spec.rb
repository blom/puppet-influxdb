require "spec_helper"

describe Puppet::Provider::InfluxDB do
  describe "#config" do
    it "returns a hash with keys converted to symbols" do
      influxdb = described_class.new
      influxdb.stub(:resource).and_return "config" => { "foo" => 0 }
      influxdb.send(:config).should eql :foo => 0
    end
  end
end
