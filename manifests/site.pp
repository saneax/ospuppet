node "ct1" {

        include system
        class { '::ntp':
 		servers  => [ '172.16.11.1' ],
  		restrict => [ '127.0.0.1'],
	}

}


node /\w+\d$/ {

        include system

	include nginx

}
