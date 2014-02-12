require "spec_helper"

describe Puppet::Type.type(:influxdb_cluster_admin) do
  it "requires a title or name" do
    expect {
      described_class.new :a => :b
    }.to raise_error Puppet::Error, /Title or name must be provided/
  end

  describe "ensure" do
    it "defaults to present" do
      type = described_class.new :username => "foo",
                                 :password => "123"
      expect(type[:ensure]).to eq :present
    end
  end

  describe "username" do
    it "is a namevar" do
      expect do
        described_class.new :ensure => "absent", :username => "foo"
      end.not_to raise_error
    end
  end

  context "when ensure is 'absent' and password is missing" do
    specify do
      expect do
        described_class.new :title => "foo", :ensure => "absent"
      end.not_to raise_error
    end
  end

  context "when ensure is 'present'" do
    context "missing password parameter" do
      specify do
        expect do
          described_class.new :title  => "foo", :ensure => "present"
        end.to raise_error /password is required\z/
      end
    end
  end
end
