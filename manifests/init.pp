class squid (
  $ensure_service                = $squid::params::ensure_service,
  $enable_service                = $squid::params::enable_service,
  $config                        = $squid::params::config,
  $cache_mem                     = $squid::params::cache_mem,
  $memory_cache_shared           = $squid::params::memory_cache_shared,
  $maximum_object_size_in_memory = $squid::params::maximum_object_size_in_memory,
  $access_log                    = $squid::params::access_log,
  $coredump_dir                  = $squid::params::coredump_dir,
  $max_filedescriptors           = $squid::params::max_filedescriptors,
  $workers                       = $squid::params::workers,
  $acls                          = $squid::params::acls,
  $http_access                   = $squid::params::http_access,
  $auth_params                   = $squid::params::auth_params,
  $http_ports                    = $squid::params::http_ports,
  $snmp_ports                    = $squid::params::snmp_ports,
  $cache_dirs                    = $squid::params::cache_dirs,
  
  $cache_miss_revalidate         = $squid::params::cache_miss_revalidate,
  $cache_mgr                     = $squid::params::cache_mgr,
  $cache_effective_user          = $squid::params::cache_effective_user,
  $cache_effective_group         = $squid::params::cache_effective_group,
  $logfile_rotate                = $squid::params::logfile_rotate,
  $logformat                     = $squid::params::logformat,  
  $snmp_incoming_address         = $squid::params::snmp_incoming_address,
  $snmp_outgoing_address         = $squid::params::snmp_outgoing_address,
  $snmp_access                   = $squid::params::snmp_access,
  $collapsed_forwarding          = $squid::params::collapsed_forwarding,
  $maximum_object_size           = $squid::params::maximum_object_size,
  $negative_ttl                  = $squid::params::negative_ttl,
  $pid_filename                  = $squid::params::pid_filename,
  $quick_abort_min               = $squid::params::quick_abort_min,
  $refresh_pattern               = $squid::params::refresh_pattern,
  $strip_query_terms             = $squid::params::strip_query_terms,
  $umask                         = $squid::params::umask,
  
  
  
) inherits ::squid::params {

  validate_string($ensure_service)
  validate_bool($enable_service)
  validate_re($cache_mem,'\d+ MB')
  validate_string($config)
  if $memory_cache_shared {
    validate_re($memory_cache_shared,['^on$','^off$'])
  }
  validate_re($maximum_object_size_in_memory,'\d+ KB')
  validate_string($access_log)
  if $coredump_dir {
    validate_string($coredump_dir)
  }
  if $max_filedescriptors {
    validate_integer($max_filedescriptors)
  }
  if $workers {
    validate_integer($workers)
  }

  if $acls {
    validate_hash($acls)
  }
  if $http_access {
    validate_hash($http_access)
  }
  if $auth_params {
    validate_hash($auth_params)
  }
  if $http_ports {
    validate_hash($http_ports)
  }
  if $snmp_ports {
    validate_hash($snmp_ports)
  }
  if $cache_dirs {
    validate_hash($cache_dirs)
  }
  if $cache_miss_revalidate {
    validate_re($cache_miss_revalidate,['^on$','^off$'])
  }
  if $cache_mgr {
    validate_string($cache_mgr)
  }
  if $cache_effective_user {
    validate_string($cache_effective_user)
  }
  if $cache_effective_group {
    validate_string($cache_effective_group)
  }
  if $logfile_rotate {
    validate_integer($logfile_rotate)
  }
  if $logformat {
    validate_hash($logformat)
  }
  if $snmp_access {
    validate_hash($snmp_access)
  }
  if $collapsed_forwarding {
    validate_re($collapsed_forwarding,['^on$','^off$'])
  }
  if $maximum_object_size {
    validate_re($maximum_object_size,'\d+ KB')
  }
  if $negative_ttl {
    validate_re($negative_ttl,'\-+\d')
  }
  if $pid_filename {
    validate_string($pid_filename)
  }
  if $quick_abort_min {
    validate_re($quick_abort_min,'\d+ KB')
  }
  if $refresh_pattern {
    validate_string($refresh_pattern)
  }
  if $strip_query_terms {
    validate_re($strip_query_terms,['^on$','^off$'])
  }
  if $umask {
    validate_integer($umask)
  }
  
  anchor{'squid::begin':} ->
  class{'::squid::install':} ->
  class{'::squid::config':} ~>
  class{'::squid::service':} ->
  anchor{'squid::end':}



}
