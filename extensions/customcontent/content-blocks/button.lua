local worona = require "worona"
local widget = require "widget"

local style = worona.style:get("customcontent")

local function createButton( field )

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

    local button_sheet = graphics.newImageSheet( style.button.image, style.button.sheet_options )

    local font = native.systemFont
    if field.reset_font == true then font = nil end

    local button = widget.newButton
    {
        width                 = field.width or 200,
        height                = 50,
        sheet                 = field.sheet or button_sheet,
        topLeftFrame          = field.topLeftFrame or 1,
        topMiddleFrame        = field.topMiddleFrame or 4,
        topRightFrame         = field.topRightFrame or 7,
        middleLeftFrame       = field.middleLeftFrame or 2,
        middleFrame           = field.middleFrame or 5,
        middleRightFrame      = field.middleRightFrame or 8,
        bottomLeftFrame       = field.bottomLeftFrame or 3,
        bottomMiddleFrame     = field.bottomMiddleFrame or 6,
        bottomRightFrame      = field.bottomRightFrame or 9,
        topLeftOverFrame      = field.topLeftOverFrame or 1,
        topMiddleOverFrame    = field.topMiddleOverFrame or 4,
        topRightOverFrame     = field.topRightOverFrame or 7,
        middleLeftOverFrame   = field.middleLeftOverFrame or 2,
        middleOverFrame       = field.middleOverFrame or 5,
        middleRightOverFrame  = field.middleRightOverFrame or 8,
        bottomLeftOverFrame   = field.bottomLeftOverFrame or 3,
        bottomMiddleOverFrame = field.bottomMiddleOverFrame or 6,
        bottomRightOverFrame  = field.bottomRightOverFrame or 9,
        label                 = field.text,
        labelColor            = field.text_color or style.button.color or { default = { 1, 1, 1, 1 }, over = { 0, 0, 0, 1 } },
        labelAlign            = field.align or "center",
        font                  = font,
        onEvent               = scrollableButtonHandler( field.parent, function() worona:do_action( field.action, field ) end )
    }



    -- Center the button
    button.x = display.contentCenterX
    button.anchorY = 0
    button.y = field.actual_y

    field.parent:insert( button )

    field.actual_y = field.actual_y + button.contentHeight + 10
end

return createButton