-- Dynamic assignment of the working resolution, based on a fixed SCREENWIDTH.

local simulatorDpis   = {   ["Droid"] = 265,
                            ["Nexus One"] = 254,
                            ["Sensation"] = 256,
                            ["Galaxy Tab"] = 170,
                            ["GT-I9300"] = 306,
                            ["Kindle Fire"] = 169,
                            ["KFTT"] = 216,
                            ["KFJWI"] = 254,
                            ["BNRV200"] = 170
                        }

SCREENWIDTH = 320
local screenHeight = display.pixelHeight * SCREENWIDTH / display.pixelWidth

local model = system.getInfo( "model" )
local androidDisplayApproximateDpi = system.getInfo("androidDisplayApproximateDpi") or simulatorDpis[ model ]

print(system.getInfo("androidDisplayWidthInInches"))

if system.getInfo("model") == "iPad" or system.getInfo("model") == "iPad Simulator" then
    SCREENWIDTH = 768
    screenHeight = display.pixelHeight * SCREENWIDTH / display.pixelWidth

elseif androidDisplayApproximateDpi ~= nil then

    local widthInInches  = display.pixelWidth / androidDisplayApproximateDpi
    local heightInInches = display.pixelHeight / androidDisplayApproximateDpi
    
    screenInches = math.sqrt(widthInInches * widthInInches + heightInInches * heightInInches)

    if screenInches >= 6 and screenInches < 8 then
        SCREENWIDTH = 520
        screenHeight = display.pixelHeight * SCREENWIDTH / display.pixelWidth
    elseif screenInches >= 8 then
        SCREENWIDTH = 768
        screenHeight = display.pixelHeight * SCREENWIDTH / display.pixelWidth
    end
    
end


application = 
    {
        content =
        {
            width = SCREENWIDTH,
            height = screenHeight,
            fps = 60,
            scale = "letterBox",
            xAlign = "center",
            yAlign = "center",
            imageSuffix = 
            {
                ["@2x"] = 1.5,
                ["@4x"] = 3.0,
            },
        },
        notification = 
        {
            iphone = {
                types = {
                    "badge", "sound", "alert"
                }
            }
        },
        launchPad = false
    }


