begin
  require "rubygems"
rescue LoadError
end

require "influxdb"

class Puppet::Provider::InfluxDB < Puppet::Provider
  def influxdb
    @_influxdb ||= ::InfluxDB::Client.new
  end
end
