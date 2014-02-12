Puppet::Type.newtype :influxdb_database_user do
  @doc = "Manage InfluxDB database users"
  ensurable do
    newvalue(:present) { provider.create }
    newvalue(:absent) { provider.destroy }
    defaultto :present
  end

  validate do
    [:database, :password].each do |param|
      if self[:ensure] == :present && self[param].nil?
        raise ArgumentError, "#{param} is required"
      end
    end
  end

  newparam :username do
    isnamevar
  end

  newparam :password do
  end

  newparam :database do
  end

  newparam :config do
  end
end
