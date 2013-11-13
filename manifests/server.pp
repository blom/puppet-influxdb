#
class influxdb::server(
  $package_ensure = present,
  $service_enable = true,
  $service_ensure = undef
) {
  include influxdb::params

  package { $influxdb::params::server_package_name:
    ensure   => $package_ensure,
    source   => $influxdb::params::server_package_source,
    provider => 'rpm',
  }

  service { $influxdb::params::server_service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasrestart => true,
    require    => Package[$influxdb::params::server_package_name],
  }
}
