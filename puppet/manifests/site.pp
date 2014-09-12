node "ct1" {

        class { 'system::repo': }
        class { 'system': }



	class { 'mysql::server': }

	
	class { 'keystone::db::mysql':
		password      => 'super_secret_db_password',
		allowed_hosts => '%',
	}
}


#node /\w+\d$/ {
#
#        include system
#
#	include nginx
#
#}
