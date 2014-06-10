-- WORONA INITIALIZATION
local worona = require "worona"
worona:init()

-- START THE LOG
worona.log:start( { level = "INFO", reset_log = true, console = true, file = "log", previous_file = "previous_log" } )

-- WORDPRESS URL
worona.wp_url = "http://www.worona.org"

-- START THE APPLICATION
worona:do_action( "init" )