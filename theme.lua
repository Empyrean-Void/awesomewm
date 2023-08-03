---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font          = "Terminess Nerd Font 10"

theme.bg_normal     = "#2d353b"
theme.bg_focus      = "#a7c080"
theme.bg_urgent     = "#e67e80"
theme.bg_minimize   = theme.bg_focus
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#d3c6aa"
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(2)
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_marked = "#91231c"

theme.tasklist_disable_icon = true

theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_fg_focus = theme.fg_normal


-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_font = theme.font

theme.wallpaper = "/home/empyrean/Pictures/wallpapers/forest.png"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
