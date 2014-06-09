local function createParagraph( field )

   local paragraph = display.newText
   {
      text     = field.text,
      fontSize = field.size or 16,
      font     = native.systemFont,
      width    = display.contentWidth - 30
   }
   paragraph.anchorX, paragraph.anchorY = 0,0
   paragraph.x, paragraph.y = 20, field.actual_y 
   paragraph:setFillColor( 0.2, 0.2, 0.2, 1 )

   field.parent:insert( paragraph )

   field.actual_y = field.actual_y + paragraph.contentHeight + 10
end

return createParagraph