#
class influxdb::ruby(
  $package_ensure = present
) {
  include influxdb::params

  package { 'influxdb_ruby':
    ensure   => $package_ensure,
    name     => 'influxdb',
    provider => 'gem',
  }
}
