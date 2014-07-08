define system::account(
  $realname,
  $sshkeys,
  $shell = '/bin/bash'
) {


  group { $title:
    ensure => present,
  }

  user { $title:
    ensure     => present,
    comment    => $realname,
    gid        => $title,
    home       => "/home/${title}",
    managehome => true,
    membership => 'minimum',
    require    => Group[$title],
    shell      => $shell,
  } 

  ssh_authorized_key { "$title":
    user => $title,
    type => rsa,
    key  => $sshkeys,
  }
}

