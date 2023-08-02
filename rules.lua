-- rules.lua

local awful = require("awful")
local beautiful = require("beautiful")

local clientkeys = ... -- Define your clientkeys table here
local clientbuttons = ... -- Define your clientbuttons table here

local rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" } },
      properties = {
        titlebars_enabled = true
      }
    },
}

return rules
