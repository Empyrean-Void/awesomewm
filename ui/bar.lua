local awful = require("awful")
local wibox = require("wibox")
local battery = require("ui.widgets.battery")
local clock = require("ui.widgets.clock")
local spacer = require("ui.widgets.spacer")
local wifi = require("ui.widgets.wifi")

if s.index == 1 then
    awful.tag({ " ", "󰈹 ", " ", "󰎆 " }, s, awful.layout.layouts[1])
else
    awful.tag({ "1", "2", "3", "4" }, s, awful.layout.layouts[1])
end

-- Create a taglist widget
s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
}

-- Create a tasklist widget
s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    tasklist_align = "center"
}

-- Create the wibox
s.mywibox = awful.wibar({ position = "top", screen = s })

-- Add widgets to the wibox
s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        s.mypromptbox,
    },
    nil,
    { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        spacer,
        clock,
        spacer,
        wifi,
        spacer,
        battery,
        spacer
    },
}

return s.mywibox:setup
