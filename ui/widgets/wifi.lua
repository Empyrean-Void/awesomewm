local wibox = require("wibox")
local awful = require("awful")

-- WiFi widget
local wifi_widget = wibox.widget {
    widget = wibox.widget.textbox,
}

-- Define the font size
local font_size = 12

-- Function to update the WiFi widget
local function update_wifi_widget()
    awful.spawn.easy_async("iwconfig wlan0", function(stdout)
        local ssid = stdout:match('ESSID:"(.-)"')
        local signal = tonumber(stdout:match('Signal level=([-%d]+) dBm'))
        local connected = ssid ~= nil and ssid ~= ""

        -- Check if WiFi is connected or not
        if not connected then
            wifi_widget.markup = "<span color='#e06c75' font='" .. font_size .. "'>󰤯 </span>"
            return
        end

        -- Define colors for different signal strength levels
        local color
        if signal >= -60 then
            color = "#a7c080" -- Green color for strong signal
        elseif signal >= -70 then
            color = "#dbbc7f" -- Yellow color for medium signal
        else
            color = "#e67e80" -- Red color for weak signal
        end

        -- Update the WiFi widget with the new markup and font size
        wifi_widget.markup = "<span color='" .. color .. "' font='" .. font_size .. "'>󰤨 </span>"
    end)
end

-- Update the WiFi widget initially
update_wifi_widget()

-- Update the WiFi widget every 10 seconds (or your preferred interval)
awful.widget.watch("iwconfig wlan0 2>/dev/null", 5, function(widget, stdout)
    update_wifi_widget()
end)

return wifi_widget
