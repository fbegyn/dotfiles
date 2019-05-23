local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local beautiful = require("beautiful")
local keys = require("keys")

local rules = {}

if screen.count() == 1 then
  return {
  -- All clients will match this rule.
  { rule = { },
    properties = { border_width = beautiful.border_width,
                   border_color = beautiful.border_normal,
                   focus = awful.client.focus.filter,
                   keys = keys.clientkeys,
                   raise = true,
                   buttons = keys.clientbuttons } },
  { rule = { class = "Qutebrowser" },
    properties = { tag = tags[1][1] } },
  { rule = { class = "Rambox",  },
    properties = { tag = tags[1][2], floating = false, skip_taskbar = false,
                    maximized = false} },
  { rule = { class = "Spotify" },
    properties = { tag = tags[1][4] } },
  { rule = { class = "Nautilus" },
    properties = { floating = true, maximized = false} },
  { rule = { class = "Org.gnome.Nautilus" },
    properties = { floating = true, maximized = false} },
  { rule = { class = "Pavucontrol" },
    properties = { floating = true, maximized = false} },
  { rule = { class = "Thunderbird" },
    properties = { tag = tags[1][3] } }
  -- Set Firefox to always map on tags number 2 of screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { tag = tags[1][2] } },
}
else
return {
  -- All clients will match this rule.
  { rule = { },
    properties = { border_width = beautiful.border_width,
                   border_color = beautiful.border_normal,
                   focus = awful.client.focus.filter,
                   keys = keys.clientkeys,
                   raise = true,
                   buttons = keys.clientbuttons } },
  { rule = { class = "Qutebrowser" },
    properties = { tag = tags[1][1] } },
  { rule = { class = "Rambox",  },
    properties = { tag = tags[2][2], floating = false, skip_taskbar = false,
                    maximized = false} },
  { rule = { class = "Spotify" },
    properties = { tag = tags[2][4] } },
  { rule = { class = "Nautilus" },
    properties = { floating = true, maximized = false} },
  { rule = { class = "Org.gnome.Nautilus" },
    properties = { floating = true, maximized = false} },
  { rule = { class = "Pavucontrol" },
    properties = { floating = true, maximized = false} },
  { rule = { class = "Thunderbird" },
    properties = { tag = tags[1][3] } }
  -- Set Firefox to always map on tags number 2 of screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { tag = tags[1][2] } },
}
end
