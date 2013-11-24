require "spec_helper"

describe Puppet::Type.type(:influxdb_cluster_admin) do
  it "requires a title or name" do
    expect {
      described_class.new :a => :b
    }.to raise_error Puppet::Error, /Title or name must be provided/
  end

  describe "username" do
    it "is a namevar" do
      expect { described_class.new :username => "foo" }.not_to raise_error
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
          described_class.new :title  => "foo",
                              :ensure => "present"
        end.to raise_error /password is required\z/
      end
    end
  end
end
