local worona = require "worona"

local function createImage( field )

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
end

return createImage