local worona  = require "worona"

local function createMap ( field )

	local function scrollableButtonHandler( scrollView, func )
        return  function( event )
            if event.phase == "moved" then
                local dx = math.abs( event.x - event.xStart )
                local dy = math.abs( event.y - event.yStart )

                if dx > 5 or dy > 5 then
                    scrollView:takeFocus( event )
                end
            elseif event.phase == "ended" then
                display.getCurrentStage():setFocus(nil)
                func()
            end

            return true
        end
    end

    local image = worona.image:newImage
   {
      image_object = field.image,
      image_path   = "content/images/",
      shape        = "normal",
      directory    = system.DocumentsDirectory,
      width        = display.contentWidth - 20,
      x            = display.contentWidth / 2,
      y            = 0
   }
   image.anchorY = 0
   image.y       = field.actual_y 

   field.parent:insert( image )

   field.actual_y = field.actual_y + image.contentHeight + 10

   image:addEventListener("touch", scrollableButtonHandler(field.parent, function() worona:do_action( "load_mapview", field ) end))



end 

return createMap
