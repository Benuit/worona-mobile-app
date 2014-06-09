local worona = require "worona"
local createButton = require( "extensions.customcontent.content-blocks.button" )

local function createList( field )

	local style = worona.style:get("customcontent")

	local attributes = {
		width                  = style.list.width,
		height                 = style.list.height,
		space_between_elements = style.list.space_between_elements,
		radius                 = 0
	}

	local listGroup = display.newGroup()

	local list_sheet_options = {
	    ["flat-ui"] = {
	        frames =
	        {
	           { x=0, y=0, width=1, height=1 },
	           { x=0, y=1, width=1, height=1 },
	           { x=0, y=2, width=1, height=1 },
	           { x=1, y=0, width=1, height=1 },
	           { x=1, y=1, width=1, height=1 },
	           { x=1, y=2, width=1, height=1 }
	        },
	        sheetContentWidth  = 2,
	        sheetContentHeight = 3
	   },
	   ["ios7"] = {
	       frames =
	       {
	          { x=0, y=0, width=4, height=4 },         -- 1. topLeftFrame
	          { x=0, y=4, width=4, height=42 },        -- 2. middleLeftFrame
	          { x=0, y=46, width=4, height=4 },        -- 3. bottomLeftFrame
	          { x=4, y=0, width=192, height=4 },       -- 4. topMiddleFrame
	          { x=4, y=4, width=192, height=42 },      -- 5. MiddleFrame
	          { x=4, y=46, width=192, height=4 },      -- 6. bottomMiddleFrame
	          { x=196, y=0, width=4, height=4 },       -- 7. topRightFrame
	          { x=196, y=4, width=4, height=42 },      -- 8. middleRightFrame
	          { x=196, y=46, width=4, height=4 }       -- 9. bottomRightFrame
	       },
	       sheetContentWidth  = 200,
	       sheetContentHeight = 50
	   }
	}
    
    local list_sheet = graphics.newImageSheet( style.list.sheet.image, style.list.sheet.options )

	for i = 1, #field.list do

		local row                 = field.list[i]
		row.actual_y              = field.actual_y
		row.width                 = display.contentWidth - 40
		row.parent                = field.parent
		row.align                 = "left"
		row.topLeftFrame          = 1
		row.topMiddleFrame        = 4
		row.topRightFrame         = 7
		row.middleLeftFrame       = 2
		row.middleFrame           = 5
		row.middleRightFrame      = 8
		row.bottomLeftFrame       = 3
		row.bottomMiddleFrame     = 6
		row.bottomRightFrame      = 9
		row.topLeftOverFrame      = 1
		row.topMiddleOverFrame    = 4
		row.topRightOverFrame     = 7
		row.middleLeftOverFrame   = 2
		row.middleOverFrame       = 5
		row.middleRightOverFrame  = 8
		row.bottomLeftOverFrame   = 3
		row.bottomMiddleOverFrame = 6
		row.bottomRightOverFrame  = 9
		row.text                  = "   " .. row.text
		row.text_color            = style.list.color
		row.reset_font            = true
		row.sheet                 = list_sheet

		createButton( row )

		local arrow = display.newImageRect( style.list.arrow.image, style.list.arrow.width, style.list.arrow.height )
		arrow.x = display.contentWidth - 40
		arrow.y = field.actual_y + attributes.height / 2
		field.parent:insert( arrow )

		field.actual_y = field.actual_y + attributes.height + attributes.space_between_elements
	end

end

return createList