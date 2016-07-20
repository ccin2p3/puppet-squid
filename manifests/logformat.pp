define squid::logformat (
  $name           = $title,
  $options        = '',
  $order          = '11',
) {

  validate_string($name)
  validate_string($options)


  concat::fragment{"squid_logformat":
    target  => $squid::config,
    content => template('squid/squid.conf.logformat.erb'),
    order   => "50-${order}",
  }
  
}
