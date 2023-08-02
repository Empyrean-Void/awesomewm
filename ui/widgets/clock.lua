local wibox = require("wibox")

-- Clock widget
local clock_widget = wibox.widget.textclock("%a %b %d, %H:%M")

-- You can customize the time format as desired. Here are some common placeholders:
--   %a: Abbreviated weekday name (e.g., Mon, Tue, ...)
--   %A: Full weekday name (e.g., Monday, Tuesday, ...)
--   %b: Abbreviated month name (e.g., Jan, Feb, ...)
--   %B: Full month name (e.g., January, February, ...)
--   %d: Day of the month (e.g., 01, 02, ..., 31)
--   %H: Hour (00 to 23)
--   %M: Minute (00 to 59)
--   %S: Second (00 to 59)
--   %Y: Four-digit year (e.g., 2023)

-- You can also update the clock format dynamically based on your needs. For example:
-- clock_widget.format = "%H:%M"  -- Display only the hour and minute

return clock_widget
