class nagios::export {
 
    @@nagios_host { $::hostname :
        ensure              => present,
        address             => $::ipaddress,
        use                 => 'generic-host',
        check_command       => 'check-host-alive',
        hostgroups          => 'all-servers',
        target              => "/etc/nagios3/conf.d/${::hostname}.cfg",
    }
 
    @@nagios_service { "${::hostname}_check-load":
        ensure              => present,
        use                 => 'generic-service', 
        host_name           => $::hostname,
        service_description => 'Current Load',
        check_command       => 'check_nrpe_1arg!check_load',
        target              => "/etc/nagios3/conf.d/${::hostname}.cfg",
    }
 
    @@nagios_service { "${::hostname}_check-disk":
        ensure              => present,
        use                 => 'generic-service', 
        host_name           => $::hostname,
        service_description => 'Clean up old kernels',
        check_command       => 'check_nrpe_1arg!check_hda1',
        target              => "/etc/nagios3/conf.d/${::hostname}.cfg",
    }

        @@nagios_service { "${::hostname}_check-users":
        ensure              => present,
        use                 => 'generic-service', 
        host_name           => $::hostname,
        service_description => 'Check for logged in users',
        check_command       => 'check_nrpe_1arg!check_users',
        target              => "/etc/nagios3/conf.d/${::hostname}.cfg",
    }
    
        @@nagios_service { "${::hostname}_check-total-procs":
        ensure              => present,
        use                 => 'generic-service', 
        host_name           => $::hostname,
        service_description => 'Check total processes',
        check_command       => 'check_nrpe_1arg!check_total_procs',
        target              => "/etc/nagios3/conf.d/${::hostname}.cfg",
    }

}
