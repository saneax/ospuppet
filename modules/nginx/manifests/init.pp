class nginx {
	package { 'nginx':
		ensure => '1.1.19-1ubuntu0.5',
	}

	service { 'nginx':
		ensure => running,
		enable => true,
		require => Package['nginx'],
	}
}




