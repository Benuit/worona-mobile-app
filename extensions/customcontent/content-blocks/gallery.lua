local worona = require "worona"

local function createGallery( field )

    local gallery_group = display.newGroup()
    gallery_group.anchorChildren = true
    gallery_group.anchorX = 0
    gallery_group.anchorY = 0

    local images_per_line = 3
    local offset = 10 --. space between images
    local border_offset = 10 --. space between border and image
    local height_level = 0
    local image_num_in_line = 0
    
    local img_obj_array = {}
   	
   	local img_width = (display.contentWidth - 2 * border_offset - images_per_line * (images_per_line - 1) * offset)/images_per_line --. for 3-images gallery
	

    for i=1, #field.gallery do
    	
        img_obj_array[i] = worona.image:newImage(
    	{
    	    image_object = field.gallery[i],
    	    image_path   = "content/images/",
    	    shape        = "square",
    	    directory    = system.DocumentsDirectory,
    	    width        = img_width,
            height       = img_width,
    	    x            = 0,
    	    y            = 0
    	})

    	img_obj_array[i].anchorX = 0
    	img_obj_array[i].anchorY = 0
    	img_obj_array[i].x       = border_offset + (img_width + offset) * image_num_in_line
    	img_obj_array[i].y       = (img_width + offset) * height_level 
    	gallery_group:insert(img_obj_array[i])

    	image_num_in_line = image_num_in_line + 1
    	if image_num_in_line == images_per_line and i ~= #field.gallery then
    		image_num_in_line = 0
    		height_level = height_level + 1
    	end	
    end
    
    
	gallery_group.y = field.actual_y
	gallery_group.x = (display.contentWidth - gallery_group.width) / 2 

	field.parent:insert( gallery_group )

	field.actual_y = field.actual_y + ( height_level + 1 ) * (img_width + offset) + 10
end

return createGallery