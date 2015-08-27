class nagios::service {
 
    exec { 'fix-permissions':
       # command     => "find /etc/nagios3/conf.d -type f -name '*cfg' | xargs chmod ugo+rw",
        command     => "/bin/chmod ugo+rw /etc/nagios3/conf.d/*.cfg",
        refreshonly => true,
    } ->
 
    service { 'nagios':
        ensure      => running,
        enable      => true,
        require     => Class[ 'nagios::install' ], 
    }
}
