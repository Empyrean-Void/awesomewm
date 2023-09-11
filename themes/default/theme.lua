---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font = "Hack Nerd Font 9"

theme.bg_normal = "#292929"
theme.fg_normal = "#abb2bf"

theme.bg_focus = "#292929"
theme.fg_focus = "#abb2bf"

theme.bg_urgent = "#e06c75"
theme.fg_urgent = "#292929"

theme.bg_minimize = "#3a3a3a"
theme.fg_minimize = "#abb2bf"

theme.bg_systray = theme.bg_normal

theme.border_normal = "#282c34"
theme.border_focus = "#4f535c"
theme.border_width = dpi(0)

theme.useless_gap = dpi(3)

-- Generate taglist squares:
local taglist_square_size = dpi(4)

theme.taglist_bg_focus = "#577784"
theme.taglist_fg_focus = "#292929"

theme.taglist_bg_normal = "#292929"
theme.taglist_fg_normal = "#abb2bf"

theme.taglist_bg_urgent = "#e06c75"
theme.taglist_fg_urgent = "#292929"

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.taglist_fg_focus)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
theme.notification_bg = "#292929"
theme.notification_fg = "#abb2bf"
theme.notification_border_color = "#577784"

theme.notification_width = 200
theme.notification_height = 50
theme.notification_border_width = dpi(2)

-- Variables set for theming the tasklist:
theme.tasklist_bg_focus = "#577784"
theme.tasklist_fg_focus = "#292929"

theme.tasklist_bg_normal = "#292929"
theme.tasklist_fg_normal = "#abb2bf"

theme.tasklist_bg_minimize = "#3a3a3a"
theme.tasklist_fg_minimize = "#abb2bf"

theme.tasklist_bg_urgent = "#e06c75"
theme.tasklist_fg_urgent = "#292929"

theme.tasklist_spacing = dpi(2)

theme.tasklist_disable_icon = true

-- Variables set for theming the titlebar buttons
theme.titlebar_minimize_button_normal = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_minimize_button_focus = "/home/void/.config/awesome/themes/default/titlebar/min.svg"

theme.titlebar_maximized_button_normal_inactive = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_maximized_button_focus_inactive = "/home/void/.config/awesome/themes/default/titlebar/max.svg"

theme.titlebar_maximized_button_normal_active = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_maximized_button_focus_active = "/home/void/.config/awesome/themes/default/titlebar/max.svg"

theme.titlebar_close_button_normal = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_close_button_focus = "/home/void/.config/awesome/themes/default/titlebar/close.svg"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
