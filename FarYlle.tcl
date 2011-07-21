package require TclOO

source server/Server.tcl

set server [Server new 8080]
$server start

vwait forever
