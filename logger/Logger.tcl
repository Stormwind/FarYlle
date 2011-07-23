package require TclOO
package require log

# Logger logs whatever you want
#
oo::class create Logger {
  
  # Constructor
  #
  constructor {} {
    my variable level
    set level "error"
    
  }

  # Sets the Log level to the given value, if it exists
  #
  #
  method setLogLevel {logLevel} {
    my variable level
    set logLevels [log::levels]
    if {[lsearch $logLevels $logLevel] == -1} {
      set message ""
      append message "Log level '" $logLevel "' does not exist."
      throw {LOG BADLEVEL} $message
    } else {
      set level $logLevel
      return 1
    }
  }

}
