local wibox = require("wibox")
local awful = require("awful")

-- Battery widget
local battery = wibox.widget {
    widget = wibox.widget.textbox,
}

-- Function to update the battery widget
local function update_battery_widget()
    awful.spawn.easy_async("/home/empyrean/.config/awesome/scripts/battery.sh", function(stdout)
        local battery_info = stdout:match("^Battery:%s+(%d+)%%")
        local battery_percentage = tonumber(battery_info) or 0
        -- Define colors for different battery levels
        local color
        if battery_percentage <= 20 then
            color = "#e57474" -- Red color for low battery
        elseif battery_percentage <= 50 then
            color = "#e5c76b" -- Yellow color for medium battery
        else
            color = "#8ccf7e" -- Green color for high battery
        end

        -- Apply color to the text using the markup function
        battery.markup = "<span color='" .. color .. "' font='12'>" .. "󰁹" .. "</span>"
    end)
end

-- Update the battery widget initially
update_battery_widget()

-- Update the battery widget every 30 seconds (or your preferred interval)
awful.widget.watch("/home/empyrean/.config/awesome/scripts/battery.sh", 30, function(widget, stdout)
    update_battery_widget()
end)

return battery
