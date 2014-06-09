local worona = require "worona"

local function rateMyAppAction()
	
	local json_read = worona.local_options:read("content/json/local_options.json")
	local show_popup
	local open_counter

	local function rateMyApp( options )
		--. options = { androidID, iosID }
	    
	    local app_store_url --. AppStore / Google Play

	    local platform = worona.device:getPlatformName()
	    
	    if platform == "iPhone OS" then
	    	if options.iosID ~= nil then
	    		app_store_url = "www.google.com" --"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id="..options.iosID
	    	else
	    		worona.log:error("rateMyApp: invalid ios ID")
	    	end
	    elseif platform == "Android" then
	    	if options.androidID ~= nil then
	        	app_store_url = "www.google.com" --"market://details?id="..options.androidID
	    	else
	    		worona.log:error("rateMyApp: invalid ios ID")
	    	end
	    end

	    -- EVENT NATIVE ALERT
	    local function rateAppListener( event )
	        if "clicked" == event.action then
	            local i = event.index
	            if i == 1 then
	                system.openURL(app_store_url)
	                worona.local_options:set("show_rate_popup" , false)
	            elseif i == 2 then
	                --. RateMe popup will appear again next time app is opened.
	            elseif i == 3 then
	            	worona.local_options:set("show_rate_popup" , false)
	            end
	        end
	    end

	    if open_counter >= 3 and show_popup == true then
	    	--. leave commented until we have the appstore URL.
	    	-- native.showAlert("¿Te gusta esta App?", "¡Déjanos tu opinión!", { "Ok", "Más tarde", "No quiero" }, rateAppListener )
	   	end
	end

	if json_read == true then
		open_counter = worona.local_options:get("open_counter")
		if open_counter == nil then
			open_counter = 1
		else
			open_counter = open_counter + 1
		end

		show_popup = worona.local_options:get("show_rate_popup")
		if show_popup == nil then
			show_popup = true
		end
		
		rateMyApp( {
			androidID = 1234,
			iosID = 1234
		})
	end

	worona.local_options:set("open_counter" , open_counter)
end

return rateMyAppAction