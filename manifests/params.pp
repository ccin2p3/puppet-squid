class squid::params {

  $ensure_service                = 'running'
  $enable_service                = true
  $config                        = '/etc/squid/squid.conf'
  $cache_mem                     = '256 MB'
  $memory_cache_shared           = undef
  $maximum_object_size_in_memory = '512 KB'
  $access_log                    = 'daemon:/var/log/squid/access.log squid'
  $coredump_dir                  = undef
  $max_filedescriptors           = undef
  $workers                       = undef
  $acls                          = undef
  $http_access                   = undef
  $auth_params                   = undef
  $http_ports                    = undef
  $snmp_ports                    = undef
  $cache_dirs                    = undef
  $cache_log                     = undef
 
  $cache_miss_revalidate         = undef
  $cache_mgr                     = undef
  $cache_effective_user          = undef
  $cache_effective_group         = undef
  $logfile_rotate                = undef
  $logformat                     = undef  
  $snmp_incoming_address         = undef
  $snmp_outgoing_address         = undef
  $snmp_access                   = undef
  $collapsed_forwarding          = undef
  $maximum_object_size           = undef
  $negative_ttl                  = undef
  $pid_filename                  = undef
  $quick_abort_min               = undef
  $refresh_pattern               = undef
  $strip_query_terms             = undef
  $umask                         = undef

}
