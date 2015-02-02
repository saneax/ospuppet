
class training {

notice "$::osfamily"

$mycontent = undef
notice "-------> $_mycontent"
$_mycontent = "something now"
notice "+++++++> $_mycontent"

$mycontent = undef

if "$::osfamily" == "Debian" {
	$_mycontent = "osfamily=$::osfamily osversion=$::operatingsystemrelease\n"
}
else {
	$_mycontent = "osfamily=unknown!!"
}

file { '/tmp/debian':
	ensure => present,
	content => "$_mycontent",
}


