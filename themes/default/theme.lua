---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "sans 8"

theme.bg_normal = "#282c34"
theme.bg_focus = "#282c34"
theme.bg_urgent = "#e06c75"
theme.bg_minimize = "#4f535c"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#abb2bf"
theme.fg_focus = "#abb2bf"
theme.fg_urgent = "#abb2bf"
theme.fg_minimize = "#abb2bf"

theme.useless_gap = dpi(3)
theme.border_width = dpi(0)
theme.border_normal = "#282c34"
theme.border_focus = "#4f535c"
theme.border_marked = "#cd5840"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)
theme.taglist_bg_focus = "#577784"
theme.taglist_fg_focus = "#282c34"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_bg = "#282c34"
theme.notification_fg = "#abb2bf"

theme.notification_border_color = "#282c34"
theme.notification_border_width = dpi(2)

theme.notification_width = 200
theme.notification_height = 50

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = "#577784"
theme.tasklist_fg_focus = "#282c34"
theme.tasklist_bg_normal = "#282c34"
theme.tasklist_bg_minimize = "#4f535c"

-- Titlebar buttons
theme.titlebar_close_button_normal = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_close_button_focus = "/home/void/.config/awesome/themes/default/titlebar/close.svg"

theme.titlebar_maximized_button_normal_inactive = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_maximized_button_focus_inactive = "/home/void/.config/awesome/themes/default/titlebar/max.svg"
theme.titlebar_maximized_button_normal_active = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_maximized_button_focus_active = "/home/void/.config/awesome/themes/default/titlebar/max.svg"

theme.titlebar_minimize_button_normal = "/home/void/.config/awesome/themes/default/titlebar/normal.svg"
theme.titlebar_minimize_button_focus = "/home/void/.config/awesome/themes/default/titlebar/min.svg"

-- You can use your own layout icons like this:
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_tile = "/home/void/.config/awesome/themes/default/tile.svg"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
