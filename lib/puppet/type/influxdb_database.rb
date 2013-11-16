Puppet::Type.newtype(:influxdb_database) do
  @doc = "Manage InfluxDB databases"
  ensurable

  newparam(:name, :namevar => true) do
    desc "Database name"
    isnamevar
  end

  newparam :config do
  end
end
