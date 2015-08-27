class nagios::nrpe {
 
    package { [ 'nagios-nrpe-server', 'nagios-plugins' ]:
        ensure      => present,
    }
 
    service { 'nagios-nrpe-server':
        ensure      => running,
        enable      => true,
        require     => Package[ 'nagios-nrpe-server', 'nagios-plugins' ],
    }

    file_line { 'allowed_hosts':
        line => 'allowed_hosts = 127.0.0.1,192.168.1.23',
        path => '/etc/nagios/nrpe.cfg',
        match => 'allowed_hosts',
        ensure => present,
        notify => Service['nagios-nrpe-server'],
    }
}
