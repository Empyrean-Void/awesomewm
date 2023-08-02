local wibox = require("wibox")

-- Create a horizontal spacer
local spacer = wibox.widget.separator {
    orientation = "horizontal",
    forced_width = 4,  -- Adjust the width as needed
    color = "#00000000",  -- Set the color to transparent to make it invisible
}

-- Create a vertical spacer
-- local spacer = wibox.widget.separator {
--     orientation = "vertical",
--     forced_height = 10,  -- Adjust the height as needed
--     color = "#00000000",  -- Set the color to transparent to make it invisible
-- }

return spacer
