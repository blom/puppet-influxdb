#
class influxdb::params {
  $server_package_name = 'influxdb'
  $server_service_name = 'influxdb'

  $server_package_source = $::architecture ? {
    /64/    => 'http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm',
    default => 'http://s3.amazonaws.com/influxdb/influxdb-latest-1.i686.rpm',
  }
}
