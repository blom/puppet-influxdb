require "influxdb"

class Puppet::Provider::InfluxDB < Puppet::Provider
  def influxdb
    @_influxdb ||= ::InfluxDB::Client.new config
  end

  private

  def config
    return {} unless resource["config"].is_a? Hash
    Hash[resource["config"].map { |key, value| [key.to_sym, value] }]
  end
end
