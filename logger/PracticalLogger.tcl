package require TclOO

source logger/Logger.tcl

# Logger for practical use
#
oo::class create PracticalLogger {
  superclass Logger

  constructor {} {
    my variable debug
    set debug 0
  }

  # Returns state of the debug logger
  #
  # @return Debug state
  method getDebug {} {
    my variable debug
    return $debug
  }

  # Sets the debug logger on or off
  #
  # @param logLevel The logLevel as string
  # @return Debug state
  method setDebug {debugSwitch} {
    my variable debug
    set debug $debugSwitch
    return $debug
  }


}