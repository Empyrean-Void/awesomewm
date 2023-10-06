local theme = require("themes.vscode")

local date = wibox.widget {
  widget = wibox.widget.textclock("󰃰 %H:%M %b %d"),
  font = theme.font
}

return date
