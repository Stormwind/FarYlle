package require TclOO

oo::class create Listener {
  
  constructor {} {}

  method listen {channel clientaddr clientport} {
    puts "Hello world"
  }


}
