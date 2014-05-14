#!/usr/bin/perl
# Copyleft Jonas Bull 2014
# GPLv2 license.  Google it.
use WWW::Mechanize;
use Net::Ping;
my $cuda='xxx.xx.xx.xx';
my $username='xxxxx';
my $password ='xxxxxxxxxxxxxx';
my $baseurl="http://$cuda/web/login";

my $p=Net::Ping->new();
die unless $p->ping($cuda);
# no need to continue unless cuda is present
my $mech = WWW::Mechanize->new();
$mech->get( $baseurl );
my @lines=$mech->response()->decoded_content;
my $redirect='';
foreach my $line (@lines){
	if ($line=~/location\.replace/){
		$line=~/'(.*)'/;
		$redirect=$1;
		break;
		# since I don't have javascript or a url I have to pick the redir
	}
}

$mech->get( $redirect);
@lines=$mech->response()->decoded_content;
foreach my $line (@lines){
	if ($line=~/$username/){
		print "Already logged in\n";
		exit; # but I can drop out if the redir has my login name
	}
}
# otherwise set form fields
$mech->form_name("main_form");
$mech->set_fields(login => $username,password => $password );
$mech->click_button(name=>'login_form_action');
# Now see if login succeeded
@lines=$mech->response()->decoded_content;
foreach my $line (@lines){
	if ($line=~/$username/){
		print "Success\n";
		exit; # and exit when you know you're good. 
	}
}
