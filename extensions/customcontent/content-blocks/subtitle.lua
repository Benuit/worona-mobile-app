local function createSubtitle( field )

   local subtitle = display.newText
   {
      text     = field.text,
      fontSize = 18,
      font     = native.systemFontBold
   }
   subtitle.anchorX, subtitle.anchorY = 0,0
   subtitle.x, subtitle.y = 10, field.actual_y 
   subtitle:setFillColor( 0, 0, 0, 1 )

   field.parent:insert( subtitle )

   field.actual_y = field.actual_y + subtitle.contentHeight + ( field.size or 16 ) / 2
end

return createSubtitle