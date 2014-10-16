-- ZERO BRANE STUDIO DEBUGGE
-- require("mobdebug").start()

-- WORONA INITIALIZATION
local worona = require "worona"
worona:initializeWoronaExtensions()

-- START THE LOG
worona.log:start( { level = "WARNING", reset_log = true, console = true, file = "log", previous_file = "previous_log" } )

-- WORONA CONFIGURATION
worona.current_style         = "flat-ui"				-- Choose your theme.
worona.wp_url                = "http://www.worona.org"  -- Enter the url from which the app will read the data.
worona.app_title             = "Worona Blog"			-- Enter the main title of your app.
worona.app_about_title       = "About Worona"			-- Enter the title of the about section.
worona.app_about_description = "Worona is a Wordpress plugin that enables you to create native apps without programming knowledge. Once installed you can use WordPress to configure your app and create content.\n\nWorona is an open source initiative to make Wordpress native in the mobile world. And just like Wordpress, you can extend it with extensions made by you or the community.\n\nYou can visit us and learn more at www.worona.org."
worona.stats				 = true 					-- Stats about worona usage.

-- START THE APPLICATION
worona:do_action( "load_style" )
worona:do_action( "init" )
worona:do_action( "go_to_scene", { scene_type = "scene-list", effect = "fade", time = 500 } )