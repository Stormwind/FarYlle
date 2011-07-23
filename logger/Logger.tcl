package require TclOO
package require log

# Logger logs whatever you want
#
oo::class create Logger {
  
  # Constructor
  #
  constructor {} {
    my variable logLevels
    my setDebug 0
    set logLevels [list "error" "notice" "info" "debug"]
  }

  method getAllLogLevels {} {
    my variable logLevels
    return [join $logLevels " "]
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

  # Sets the log output to the given channel
  #
  # @param logLevel log level
  # @param channel log channel
  # @return 1
  # @thows LOG BADLEVEL, if log level does not exist
  method setLogChannel {logLevel channel} {
    my variable logLevels
    if {[lsearch $logLevels $logLevel] == -1} {
      set message ""
      append message "Cannot set channel for log level '" $logLevel "', because this log level does not exist."
      throw {LOG BADLEVEL} $message
    } else {
      return 1
    }
  }



}
