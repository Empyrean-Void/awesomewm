local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local theme = require("themes.forest.theme")
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
        style = {
            shape_border_width = 2,
            shape_border_color_focus = theme.bg_accent,
            shape_border_color = theme.bg_normal,
            shape_border_color_urgent = theme.bg_urgent,

            shape = gears.shape.rounded_rect,
        },
    })

    -- Create a tasklist widget
    local mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style = {
            shape_border_width = 2,
            shape_border_color_focus = theme.bg_accent,
            shape_border_color = '#6c6c6c',
            shape_border_color_minimized = theme.bg_minimize,
            shape_border_color_urgent = theme.bg_urgent,

            shape = gears.shape.rounded_bar,
            align = "center",
        },
    })

    -- Create a textclock widget
    local clock_widget = wibox.widget.textclock("󰃰 %H:%M %b %d")

    -- Create a separator widget (spacer)
    local spacer = wibox.widget.textbox(" ")

    -- Create the wibox
    local mywibox = awful.wibar({
        position = "bottom",
        screen = s,
        width = 1900,
        opacity = 0.85,
        style = {
            shape = gears.shape.rounded_bar,
        }
    })

    -- Add widgets to the wibox
    mywibox:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacer,
            mytaglist,
            spacer,
        },
        mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spacer,
            battery_widget,
            spacer,
            clock_widget,
            spacer,
        },
    })
end

-- Export the create_wibar function
return {
    create_wibar = create_wibar
}
