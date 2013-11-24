Puppet::Type.newtype :influxdb_cluster_admin do
  @doc = "Manage InfluxDB cluster admins"
  ensurable

  validate do
    if self[:ensure] == :present && self[:password].nil?
      raise ArgumentError, "password is required"
    end
  end

  newparam :username do
    isnamevar
  end

  newparam :password do
  end

  newparam :config do
  end
end
