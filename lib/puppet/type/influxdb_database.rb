Puppet::Type.newtype(:influxdb_database) do
  @doc = "Manage InfluxDB databases"
  ensurable do
    newvalue(:present) { provider.create }
    newvalue(:absent) { provider.destroy }
    defaultto :present
  end

  newparam :name do
    desc "Database name"
    isnamevar
  end

  newparam :replication_factor do
    desc "Replication factor"
  end

  newparam :config do
  end
end
