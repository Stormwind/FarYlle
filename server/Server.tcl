package require TclOO

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
    set channel [socket -server listener $port]
    if {$channel != ""} {
      return 1
    } else {
      return 0; # Maybe throw exception later
    }
  }

  method listener {channel clientaddr clientport} {
    puts "Hello world"
  }


}