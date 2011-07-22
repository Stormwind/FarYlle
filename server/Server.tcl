package require TclOO

source server/Listener.tcl

oo::class create Server {
  
  constructor {serverPort} {
    my variable port
    set port $serverPort
  }

  method getPort {} {
    my variable port
    return $port
  }

  method start {} {
    my variable port
    my variable channel
    global listener; # Hack for client server connection
    set listener [Listener new]
    set channel [socket -server {$listener listen} $port]
    if {$channel != ""} {
      return 1
    } else {
      return 0; # Maybe throw exception later
    }
  }

}