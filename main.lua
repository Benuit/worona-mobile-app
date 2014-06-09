-- ZERO BRANE STUDIO DEBUGGER
--require("mobdebug").start()

-- WORONA INITIALIZATION
local worona = require "worona"
worona:init()

-- START THE LOG
worona.log:start( { level = "INFO", reset_log = true, console = true, file = "log", previous_file = "previous_log" } )

-- START THE APPLICATION
worona:do_action( "init" )