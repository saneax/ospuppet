class scontrol::accounts (
  $localusers={},
) {
  notice ("$localusers I have")
  $users = hiera ('scontrol::accounts::localusers', {})
  notice ("I Got [$users] from hiera")

  create_resources('scontrol::localuser',$users)
}

