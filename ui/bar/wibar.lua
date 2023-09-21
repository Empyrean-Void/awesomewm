local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local battery_widget = require("ui.bar.widgets.battery")

local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                {raise = true}
            )
        end
    end),
    awful.button({ }, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
    end),
    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
    end))
local function create_wibar(s)
    -- Create a taglist widget
    local mytaglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    })

    -- Create a tasklist widget
    local mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    })

    -- Create the wibox
    local mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    mywibox:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mytaglist,
        },
        mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            battery_widget,
            mytextclock,
        },
    })
end

-- Export the create_wibar function
return {
    create_wibar = create_wibar
}
