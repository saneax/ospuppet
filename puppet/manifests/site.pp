node "ct1" {

        class { 'system::repo': }
        class { 'system': }



	class { 'mysql::server': }

	
	class { 'keystone::db::mysql':
		
		password      => 'super_secret_db_password',
		allowed_hosts => '%',
	}
	
	class { 'keystone':
		verbose        => True,
		catalog_type   => 'sql',
		admin_token    => 'random_uuid',
		sql_connection => 'mysql://keystone:super_secret_db_password@ct1.os.loc/keystone',
	}

}


#node /\w+\d$/ {
#
#        include system
#
#	include nginx
#
#}
