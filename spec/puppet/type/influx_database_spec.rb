require "spec_helper"

describe Puppet::Type.type(:influxdb_database) do
  it "requires a title or name" do
    expect {
      described_class.new :a => :b
    }.to raise_error Puppet::Error, /Title or name must be provided/
  end
end
