local wibox = require("wibox")
local awful = require("awful")
local theme = require("themes.forest")

local function battery_left_click()
    awful.spawn.easy_async({"zsh", "-c", "~/.config/awesome/scripts/power-save.sh"})
end

-- Battery widget
local battery = wibox.widget.textbox("")

battery:buttons(
    awful.button({}, 1, nil, function() battery_left_click() end)
)

-- Function to update the battery widget
local function update_battery_widget()
    awful.spawn.easy_async({"bash", "-c", "/home/void/.config/awesome/scripts/battery.sh"}, function(stdout)
        local battery_percentage = stdout
        battery.text = "󰁹 " .. battery_percentage .. "%"
        battery.font = theme.font
    end)
end

-- Update the battery widget initially
update_battery_widget()

-- Update the battery widget every 30 seconds (or your preferred interval)
awful.widget.watch("/home/void/.config/awesome/scripts/battery.sh", 30, function(widget, stdout)
    update_battery_widget()
end)

return battery
