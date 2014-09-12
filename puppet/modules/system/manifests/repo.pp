class system::repo ( $repo_host = "172.16.11.1" ) {
#172.16.11.1 is the repo server locally
        if $repo_host == 'UNSET' {
                fail("To install repo host, you need to populate the $repo_host variable")
        } else {
        	file { '/etc/apt/sources.list':
        		content => template ('system/sources.list.erb'),
			ensure => "present",
		}
        }
}

