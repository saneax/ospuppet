class system::apt ($proxy_server='UNSET') {
	if $proxy_server == 'UNSET' {
		fail("To install apt proxy config, you need to populate the $proxy_server variable")
	} else {
		file { '/etc/apt/apt.conf':
			content => template('system/apt.erb'),
			ensure => present,
		}
	} 
}



