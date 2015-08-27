class nagios::install {
    package { [ 'nagios3', 'nagios-plugins', 'nagios-nrpe-plugin' ]:
        ensure  => present,
    }
}
