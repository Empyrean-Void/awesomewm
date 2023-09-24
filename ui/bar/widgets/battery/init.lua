local wibox = require("wibox")
local awful = require("awful")
local theme = require("themes.forest")

-- Battery widget
local battery = wibox.widget {
    widget = wibox.widget.textbox,
}

-- Function to update the battery widget
local function update_battery_widget()
    awful.spawn.easy_async("/home/void/.config/awesome/scripts/battery.sh", function(stdout)
        font = theme.font
        battery_percentage = stdout
        color = theme.fg_normal
        battery.markup = "<span font=\"" .. font .. "\" color=\"" .. color .. "\">󰁹 " .. battery_percentage .. "%</span>"
    end)
end

-- Update the battery widget initially
update_battery_widget()

-- Update the battery widget every 30 seconds (or your preferred interval)
awful.widget.watch("/home/void/.config/awesome/scripts/battery.sh", 30, function(widget, stdout)
    update_battery_widget()
end)

return battery
