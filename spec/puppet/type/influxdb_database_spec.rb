require "spec_helper"

describe Puppet::Type.type(:influxdb_database) do
  describe "ensure" do
    it "defaults to present" do
      type = described_class.new :name => "foo"
      expect(type[:ensure]).to eq :present
    end
  end

  it "requires a title or name" do
    expect {
      described_class.new :a => :b
    }.to raise_error Puppet::Error, /Title or name must be provided/
  end
end
