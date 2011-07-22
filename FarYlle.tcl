package require TclOO

source server/Server.tcl

#
# Main file for FårYlle
#

# Starts server
set server [Server new 8080]
$server start
# Wait...
vwait forever
