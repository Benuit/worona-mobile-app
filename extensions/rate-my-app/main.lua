local worona = require "worona"

worona:add_action( "init", require( "extensions.rate-my-app.actions.rate-my-app" ) )