package require TclOO

source server/Listener.tcl

# Class for configuring the server and initializing the connetion to the socket
#
oo::class create Server {
  
  # Constructor
  # Sets the port
  #
  # @param ServerPort Port for the connection (Must be an integer)
  # @return Nothing
  constructor {serverPort} {
    my variable port
    set port $serverPort
  }

  # Returns the port
  #
  # @return Port of the connection
  method getPort {} {
    my variable port
    return $port
  }

  # Starts connection with a socket using the given port
  # Initializes listener
  #
  # @return 1 if connectet 0 otherwise
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