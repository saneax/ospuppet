class scontrol::accounts (
  $localusers='UNSET',
) {
  notice ("$localusers I have")
  $users = hiera ('scontrol::accounts::localusers', {})
  notice ("I Got [$users] from hiera")

  create_resources('scontrol::localuser',$users)
}

