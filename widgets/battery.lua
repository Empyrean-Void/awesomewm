local wibox = require("wibox")
local awful = require("awful")

-- Battery widget
local battery = wibox.widget {
    widget = wibox.widget.textbox,
}

-- Function to update the battery widget
local function update_battery_widget()
    awful.spawn.easy_async("/home/empyrean/.config/awesome/scripts/battery.sh", function(stdout)
        battery.text = stdout
    end)
end

-- Update the battery widget initially
update_battery_widget()

-- Update the battery widget every 30 seconds (or your preferred interval)
awful.widget.watch("/home/empyrean/.config/awesome/scripts/battery.sh", 30, function(widget, stdout)
    update_battery_widget()
end)

return battery
