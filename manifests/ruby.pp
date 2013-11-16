#
class influxdb::ruby(
  $package_ensure = present
) {
  include influxdb::params

  # Because of a bug in Puppet, packages can't have similar names even if the
  # provider is different. Since both the server package and gem is called
  # `influxdb` we use `exec` instead of `package` to install the gem. See the
  # following for more information: http://projects.puppetlabs.com/issues/1398

  Exec {
    path => '/bin:/usr/bin:/usr/local/bin',
  }

  $exec_conditional = 'gem list influxdb | egrep -q "^influxdb "'

  if $package_ensure == 'installed' or $package_ensure == 'present' {
    exec { 'install influxdb gem':
      command => 'gem install influxdb',
      unless  => $exec_conditional,
    }
  } elsif $package_ensure == 'absent' {
    exec { 'uninstall influxdb gem':
      command => 'gem uninstall influxdb',
      onlyif  => $exec_conditional,
    }
  } else {
    fail("Invalid value for \$package_ensure: '${package_ensure}'")
  }
}
