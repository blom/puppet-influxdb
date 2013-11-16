puppet-influxdb
===============

[![Build Status](https://travis-ci.org/blom/puppet-influxdb.png)](https://travis-ci.org/blom/puppet-influxdb)

Puppet module for [InfluxDB][1].

Providers for managing databases and users are coming soon.

Usage
-----

### influxdb::server

Installs the InfluxDB server.

    class { 'influxdb::server':
    }

Takes the following optional attributes:

* `package_ensure`: The `ensure` passed to `package` (default: `present`).
* `service_enable`: The `enable` passed to `service` (default: `true`).
* `service_ensure`: The `ensure` passed to `service` (default: `undef`).

Note that `influxdb::server` only works on systems with an [RPM provider][2] at
the moment.

### influxdb::ruby

Installs the InfluxDB Ruby library.

    class { 'influxdb::ruby':
    }

Takes the following optional attributes:

* `package_ensure`: Ensure the presence (`present` or `installed`) or absence
  (`absent`) of the gem (default: `present`). The `package` type is currently
  not used to install the gem due to a bug in Puppet - see the [manifest][3]
  for more information.

[1]: http://influxdb.org/
[2]: http://docs.puppetlabs.com/references/latest/type.html#package-provider-rpm
[3]: https://github.com/blom/puppet-influxdb/blob/master/manifests/ruby.pp
