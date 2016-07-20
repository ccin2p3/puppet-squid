define squid::refresh_pattern (
  $name = $title,
  $entries = [],
  $order   = '01',
) {

  validate_string($name)
  validate_array($entries)

  concat::fragment{"squid_refresh_pattern_${name}":
    target  => $::squid::config,
    content => template('squid/squid.conf.refresh_pattern.erb'),
    order   => "10-${order}",
  }

}
