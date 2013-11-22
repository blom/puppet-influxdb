require "spec_helper"

describe Puppet::Type.type(:influxdb_database_user) do
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

  context "when ensure is 'absent' and database/password is missing" do
    specify do
      expect do
        described_class.new :title => "foo", :ensure => "absent"
      end.not_to raise_error
    end
  end

  context "when ensure is 'present'" do
    context "missing database parameter" do
      specify do
        expect do
          described_class.new :title    => "foo",
                              :ensure   => "present",
                              :password => "password"
        end.to raise_error Puppet::ResourceError, /database is required\z/
      end
    end

    context "missing password parameter" do
      specify do
        expect do
          described_class.new :title    => "foo",
                              :ensure   => "present",
                              :database => "database"
        end.to raise_error Puppet::ResourceError, /password is required\z/
      end
    end
  end
end
