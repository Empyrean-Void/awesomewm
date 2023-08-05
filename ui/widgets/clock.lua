local wibox = require("wibox")

-- Clock widget
local clock_widget = wibox.widget.textclock("%a %b %d, %H:%M")

return clock_widget
