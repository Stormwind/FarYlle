package require TclOO

# Logger logs whatever you want
#
oo::class create Logger {
  
  # Constructor
  #
  constructor {} {
    my variable logLevels
    array set logLevels {}
  }

  # Returns all available log levels
  #
  method getAllLogLevels {} {
    my variable logLevels
    return [join [lsort [array names logLevels]] " "]
  }

  # Adds log level
  #
  method addLogLevel {logLevel channel} {
    my variable logLevels
    if {[array get logLevels $logLevel] != []} {
      set message ""
      append message "Cannot add log level '" $logLevel "', because it already exists."
      throw {LOG EXISTINGLEVEL} $message
    } else {
      set logLevels($logLevel) $channel
      return 1
    }
  }

  # Sets the log output to the given channel
  #
  # @param logLevel log level
  # @param channel log channel
  # @return 1
  # @thows LOG BADLEVEL, if log level does not exist
  method setLogChannel {logLevel channel} {
    my variable logLevels
    if {[array get logLevels $logLevel] == []} {
      set message ""
      append message "Cannot set channel for log level '" $logLevel "', because this log level does not exist."
      throw {LOG BADLEVEL} $message
    } else {
      set logLevels($logLevel) $channel
      return 1
    }
  }

 # Logs a message to the given log level
 #
 # @param level
 # @param message
 # @return 1, if message could be logged
 method logMessage {logLevel message} {
   my variable logLevels
   if {[array get logLevels $logLevel] == []} {
      set message ""
      append message "Cannot log message to level '" $logLevel "', because this log level does not exist."
      throw {LOG BADLEVEL} $message
   } else {
     set channel $logLevels($logLevel)
     if {$channel == 0} {
       return 0
     } else {
       puts $channel $message
       return 1
     }
   }
 }

}
