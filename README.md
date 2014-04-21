puppet-influxdb
===============

[![Build Status](http://img.shields.io/travis/blom/puppet-influxdb.svg)][travis]
[![Coverage Status](http://img.shields.io/coveralls/blom/puppet-influxdb.svg)][coveralls]

[travis]: https://travis-ci.org/blom/puppet-influxdb
[coveralls]: https://coveralls.io/r/blom/puppet-influxdb

* [Homepage](https://github.com/blom/puppet-influxdb)

Puppet module for [InfluxDB][1].

Installation
------------

### Puppetfile

``` ruby
mod "influxdb", :git => "https://github.com/blom/puppet-influxdb.git"
```

Usage
-----

### Classes

#### influxdb::server

Installs the InfluxDB server.

``` puppet
class { 'influxdb::server':
}
```

Takes the following optional attributes:

* `package_ensure`: The `ensure` passed to `package` (default: `present`).
* `service_enable`: The `enable` passed to `service` (default: `true`).
* `service_ensure`: The `ensure` passed to `service` (default: `undef`).

Note that `influxdb::server` only works on systems with an [RPM provider][2] at
the moment.

#### influxdb::ruby

Installs the [InfluxDB Ruby library][3].

``` puppet
class { 'influxdb::ruby':
}
```

Takes the following optional attributes:

* `package_ensure`: Ensure the presence (`present` or `installed`) or absence
  (`absent`) of the gem (default: `present`). The `package` type is currently
  not used to install the gem due to a bug in Puppet - see the [manifest][4]
  for more information.

### Types and providers

These providers use the InfluxDB Ruby library that you can install using the
`influxdb::ruby` class.

The types below can take an optional configuration hash where its keys
correspond to the values that the Ruby library (used to talk to the InfluxDB
instance) accepts. For example:

``` puppet
$influxdb_config = {
  host     => 'localhost',
  port     => 8086,
  username => 'root',
  password => 'root',
}

Influxdb_database {
  config => $influxdb_config,
}

influxdb_database { ['foo', 'bar']:
  ensure => present,
}
```

#### influxdb_database

Manages databases.

``` puppet
influxdb_database { 'database_name':
}
```

Takes the following attributes:

* `ensure`: Ensure the presence (`present`) or absence (`absent`) of a database
  (default: `present`).
* `name`: Database name. Overrides the title, if present.
* `replication_factor`: Optional replication factor.
* `config`: Optional configuration hash.

#### influxdb_database_user

Manages database users.

``` puppet
influxdb_database_user { 'username':
  password => 'foobar',
  database => 'database_name',
}
```

Takes the following attributes:

* `ensure`: Ensure the presence (`present`) or absence (`absent`) of the user
  (default: `present`).
* `username`: The user's username. Overrides the title, if present.
* `password`: The user's password.
* `database`: The user's database.
* `config`: Optional configuration hash.

#### influxdb_cluster_admin

Manages cluster admins.

``` puppet
influxdb_cluster_admin { 'username':
  password => 'foobar',
}
```

Takes the following attributes:

* `ensure`: Ensure the presence (`present`) or absence (`absent`) of the admin
  (default: `present`).
* `username`: The admin's username. Overrides the title, if present.
* `password`: The admin's password.
* `config`: Optional configuration hash.

[1]: http://influxdb.org/
[2]: http://docs.puppetlabs.com/references/latest/type.html#package-provider-rpm
[3]: https://github.com/influxdb/influxdb-ruby
[4]: https://github.com/blom/puppet-influxdb/blob/master/manifests/ruby.pp
