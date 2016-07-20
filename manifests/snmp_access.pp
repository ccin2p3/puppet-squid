define squid::snmp_access (
  $action = 'allow',
  $value  = $title,
  $order   = '10',
) {

  validate_re($action,['^allow$','^deny$'])
  validate_string($value)


  concat::fragment{"squid_snmp_access_${value}":
    target  => $squid::config,
    content => template('squid/squid.conf.snmp_access.erb'),
    order   => "20-${order}-${action}",
  }

}
