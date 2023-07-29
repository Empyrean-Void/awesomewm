local wibox = require("wibox")
local awful = require("awful")

-- volume widget
local volume = wibox.widget {
    widget = wibox.widget.textbox,
}

-- Function to update the volume widget
local function update_volume_widget()
    awful.spawn.easy_async("/home/empyrean/.config/awesome/scripts/volume.sh", function(stdout)
        local volume_percentage = tonumber(stdout:match("Volume:%s+(%d+)%%")) or 0

        local is_muted = stdout:match("Muted:%s+(%a+)")
        is_muted = (is_muted == "yes")

        -- Define colors for different volume levels
        local color
        if is_muted then
            color = "#e06c75" -- White color for muted volume
        elseif volume_percentage <= 20 then
            color = "#e06c75" -- Red color for low volume
        elseif volume_percentage <= 50 then
            color = "#e5c07b" -- Yellow color for medium volume
        else
            color = "#98c379" -- Green color for high volume
        end

        -- Apply color to the text using the markup function
        volume.markup = "<span color='" .. color .. "'>Vol: " .. volume_percentage .. "%</span>"
    end)
end

-- Update the volume widget initially
update_volume_widget()

-- Update the volume widget every 0.5 seconds (or your preferred interval)
awful.widget.watch("/home/empyrean/.config/awesome/scripts/volume.sh", 0.5, function(widget, stdout)
    update_volume_widget()
end)

return volume
