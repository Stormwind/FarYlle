package require TclOO

# The listener listens to a by server opened port
#
oo::class create Listener {
  
  # Empty constructor Does nothing
  #
  constructor {} {}

  # Method which is called, if a client connects
  #
  # @param Identifyer for in-/output channel
  # @param IP of the connected client
  # @param ? Currently not needed
  method listen {channel clientaddr clientport} {
    puts "Hello world"
  }


}
