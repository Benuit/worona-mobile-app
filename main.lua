-- ZERO BRANE STUDIO DEBUGGE
-- require("mobdebug").start()

-- WORONA INITIALIZATION
local worona = require "worona"
worona:initializeWoronaExtensions()

-- START THE LOG
worona.log:start( { level = "INFO", reset_log = true, console = true, file = "log", previous_file = "previous_log" } )

-- WORONA CONFIGURATION
worona.current_style         = "flat-ui"
worona.wp_url                = "http://www.worona.org"  --. Enter the url from which the app will read the data.
worona.app_title             = "Worona Blog"
worona.app_about_title       = "About Worona"
worona.app_about_description = "This is the worona.org blog."

-- START THE APPLICATION
worona:do_action( "load_style" )
worona:do_action( "init" )
worona:do_action( "go_to_scene", { scene_type = "scene-list", effect = "fade", time = 500 } )
-- worona:do_action( "load_url", { url = "http://www.civitatis.com" } )