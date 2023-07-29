local wibox = require("wibox")
local awful = require("awful")

-- volume widget
local volume = wibox.widget {
    widget = wibox.widget.textbox,
}

-- Function to update the volume widget
local function update_volume_widget()
    awful.spawn.easy_async("/home/empyrean/.config/awesome/scripts/volume.sh", function(stdout)
        volume.text = stdout
    end)
end

-- Update the volume widget initially
update_volume_widget()

-- Update the volume widget every 30 seconds (or your preferred interval)
awful.widget.watch("/home/empyrean/.config/awesome/scripts/volume.sh", 30, function(widget, stdout)
    update_volume_widget()
end)

return volume
