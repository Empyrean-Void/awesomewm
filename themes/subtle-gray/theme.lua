-- Subtle Gray theme --

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font = "Hack Nerd Font 9"

-- Colors
theme.bg_normal = "#262626"
theme.fg_normal = "#abb2bf"

theme.bg_focus = "#262626"
theme.fg_focus = "#abb2bf"

theme.bg_urgent = "#e06c75"
theme.fg_urgent = "#262626"

theme.bg_minimize = "#3a3a3a"
theme.fg_minimize = "#abb2bf"

theme.bg_accent = "#937aa3"

-- System tray
theme.bg_systray = theme.bg_normal

-- Border
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_minimize
theme.border_width = dpi(0)

-- Gaps
theme.useless_gap = dpi(3)

-- Taglist
local taglist_square_size = dpi(4)

theme.taglist_bg_focus = theme.bg_accent
theme.taglist_fg_focus = theme.bg_normal

theme.taglist_bg_normal = theme.bg_normal
theme.taglist_fg_normal = theme.fg_normal

theme.taglist_bg_urgent = theme.bg_urgent
theme.taglist_fg_urgent = theme.bg_normal

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.taglist_fg_focus)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Notifications
theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_border_color = theme.bg_accent

theme.notification_width = 200
theme.notification_height = 50
theme.notification_border_width = dpi(2)

-- Tasklist
theme.tasklist_bg_focus = theme.bg_accent
theme.tasklist_fg_focus = theme.bg_normal

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_fg_normal = theme.fg_normal

theme.tasklist_bg_minimize = theme.bg_minimize
theme.tasklist_fg_minimize = theme.fg_normal

theme.tasklist_bg_urgent = theme.bg_urgent
theme.tasklist_fg_urgent = theme.bg_normal

theme.tasklist_spacing = dpi(2)

theme.tasklist_disable_icon = true

-- Titlebar buttons
theme.titlebar_minimize_button_normal = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), "subtle-gray")
theme.titlebar_minimize_button_focus = string.format("%s/.config/awesome/themes/%s/titlebar/min.svg", os.getenv("HOME"), "subtle-gray")

theme.titlebar_maximized_button_normal_inactive = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), "subtle-gray")
theme.titlebar_maximized_button_focus_inactive = string.format("%s/.config/awesome/themes/%s/titlebar/max.svg", os.getenv("HOME"), "subtle-gray")

theme.titlebar_maximized_button_normal_active = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), "subtle-gray")
theme.titlebar_maximized_button_focus_active = string.format("%s/.config/awesome/themes/%s/titlebar/max.svg", os.getenv("HOME"), "subtle-gray")

theme.titlebar_close_button_normal = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), "subtle-gray")
theme.titlebar_close_button_focus = string.format("%s/.config/awesome/themes/%s/titlebar/close.svg", os.getenv("HOME"), "subtle-gray")

-- Wallpaper
theme.wallpaper = string.format("%s/.config/awesome/themes/%s/wallpaper.png", os.getenv("HOME"), "subtle-gray")

-- Icons
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
