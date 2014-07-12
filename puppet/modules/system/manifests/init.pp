class system {
#Other System commands
  file { "/etc/apt/sources.list.d/puppetlabs.list":
	ensure => absent,
  }
  
  file { "/etc/hosts":
	content => template('system/hosts.erb'),
	ensure => present,
  }

#  file { "/etc/environment":
#	content => template ('system/environment.erb'),
#	ensure => present,
#  }


#Packages install

  $enhancer_packages = [ "mtr-tiny", "tcpdump", "screen", "vim", "emacs23-nox", "curl", "rsync", "lynx", "git", "python-pip", "build-essential", "python-dev" ]
  package { $enhancer_packages: ensure => "installed", }
  
#sudo pip install Glances
#sudo pip install PySensors

  $pip_packages = [ "Glances", "PySensors" ]
  package { $pip_packages: ensure => "installed", provider => "pip" }

  class { '::ntp':
        servers  => [ '1.in.pool.ntp.org', '1.asia.pool.ntp.org' ],
        restrict => [ '127.0.0.1' ],
  }


#Essential Proxy services install


#  exec { "/usr/bin/apt-get update":
#    require => File['/etc/apt/sources.list'],
#  }
  
#  file { '/etc/apt/sources.list':
#    source => 'puppet:///modules/system/sources.list',
#    require => File['/etc/apt/apt.conf']
#  }
  
#  file { '/etc/apt/apt.conf':
#    source => 'puppet:///modules/system/apt.conf'
#  }

        

#Accounts
  realize System::Account[sanjayu]

  class { 'sudo':
    purge => false,
    config_file_replace => false,
  }

  sudo::conf { 'sanjayu':
    priority => 11,
    content  => "sanjayu ALL=(ALL) NOPASSWD: ALL",
  }

  @system::account { 'sanjayu':
    realname => 'Sanjay Upadhyay',
    sshkeys  => "AAAAB3NzaC1yc2EAAAABIwAAAQEAqqn1SeVuzQIZTski6aeWhH39E7icc35Axb5Hv9E8JXxXmxCIgOk+N9bEVPBB7UQsb7R7gLsbYraeKHNFg9D2n9YPEcUVdBttON2Th5tg/y4nMOxzkoWWLIe9HdrovfpAE+RzA6Ti28zjhddNCsL9ZU5riCJzdI1sXlJD5OmjYMuI+mocAzwh8dHrMrXD5iqzfQoK7FC1XzMuOTwa+so4tZqgeqWStaGgTAfTXmYi/0RIeFG2OXc03khBzLP/gLprlFEHJX4O60gGLEHbfyRk11x+trR9JUobR1FFF0q8JNoeuRW4bKkelCtEGjDry+Qh4yIg4cbBGunlRf3a4VWDqw==",
  }

  group { 'sudo':
        name => 'sudo',
        ensure => present,
        members => "sanjayu",
  }

}
