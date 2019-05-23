--Configure home path so you dont have too
home_path  = os.getenv('HOME') .. '/'
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
beautiful.init( awful.util.getdir("config") .. "/themes/default/theme.lua" )
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
--Vicious + Widgets
vicious = require("vicious")
local wi = require("wi")
require("cpu-widget.cpu-widget")
-- Lain additions
local lain = require("lain")
-- Mouse and floating window management
require("collision")()
-- xrandr help
local xrandr = require('xrandr')
-- revelation
local revelation=require("revelation")
revelation.init()
-- vicious widgets
local vicious = require("vicious")
-- keybondings in seperate file
local keys = require("keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end
-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
shell = "alacritty -e tmux new-session -A -s main"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
locker = "i3lock -c 000000"
browser = 'qutebrowser'
filemanager = 'nautilus'

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.top,
    awful.layout.suit.tile.bottom,
    --lain.layout.termfair.center,
    --lain.layout.cascade.tile,
    lain.layout.centerwork,
    lain.layout.centerwork.horizontal,
    lain.layout.termfair,
    awful.layout.suit.floating,
    --awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.fair,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.se,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.nw
}
-- }}}

-- {{{ Naughty presets
naughty.config.padding = 8
naughty.config.spacing = 8
naughty.config.defaults.timeout = 5
naughty.config.defaults.screen = 1
naughty.config.defaults.position = "top_middle"
naughty.config.defaults.margin = 8
naughty.config.defaults.gap = 1
naughty.config.defaults.ontop = true
naughty.config.defaults.font = "terminus 10"
naughty.config.defaults.icon = nil
naughty.config.defaults.icon_size = 32
-- naughty.config.defaults.fg = beautiful.fg_tooltip
naughty.config.defaults.fg = "#eee8d5"
-- naughty.config.defaults.bg = beautiful.bg_tooltip
naughty.config.defaults.bg = "#002b36"
naughty.config.defaults.border_color = beautiful.border_tooltip
naughty.config.defaults.border_width = 2
naughty.config.defaults.hover_timeout = nil
naughty.config.defaults.shape = gears.shape.rounded_rect
-- -- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
 names  = {
            '🌐:Web',
            '⌥::Social',
            '📧:Mail',
            '🎼:Music',
            '📼:Videos',
            '✇ :IDE',
            '📁:Files',
            '8',
            '⚙️ :Terminal',
          },
 layout = {
      layouts[1],  -- 1:Web
      layouts[9],  -- 2:Social
      layouts[10], -- 3:Mail
      layouts[9],  -- 4:Music
      layouts[9],  -- 6:Entertainement
      layouts[1],  -- 5:IDE
      layouts[1],  -- 7:Files
      layouts[1],  -- 8:
      layouts[1],  -- 9:Terminal
          }
       }
  for s = 1, screen.count() do
 -- Each screen has its own tag table.
 tags[s] = awful.tag(tags.names, s, tags.layout)
 end
-- }}}

-- Wallpaper Changer Based On
-- menu icon menu pdq 07-02-2012
 local wallmenu = {}
 local function wall_load(wall)
 local f = io.popen('ln -sfn ' .. home_path .. '.config/awesome/wallpapers/' .. wall .. ' ' .. home_path .. '.config/awesome/themes/default/bg.png')
 awesome.restart()
 end
 local function wall_menu()
 local f = io.popen('ls -1 ' .. home_path .. '.config/awesome/wallpapers/')
 for l in f:lines() do
 local item = { l, function () wall_load(l) end }
 table.insert(wallmenu, item)
 end
 f:close()
 end
 wall_menu()

-- {{{ Menu
-- Create a laucher widget and a main menu
-- Awesome menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

-- System settings menu
mysystemsettings = {
}

-- System menu
lockscreen = function() awful.util.spawn(locker) end
suspend = function() awful.util.spawn("systemctl suspend") end
reboot = function() awful.util.spawn("systemctl reboot") end
poweroff = function() awful.util.spawn("systemctl poweroff -i") end
mysystemmenu = {
   { "lock system", lockscreen },
   { "suspend", suspend },
   { "reboot", reboot },
   { "poweroff", poweroff }
}

-- Screenshot menu
screenshot = "/usr/bin/maim"
screenshot_imgur = screenshot .. " | /home/francis/Scripts/imgur.sh"
screenshot_file = screenshot .. " ~/Pictures/Screenshots/$(date +%F-%T).png"
screenshot_clipboard = screenshot .. " | xclip -selection clipboard -t image/png"
screenshot_selection = "/usr/bin/maim -s"
screenshot_select_imgur = screenshot_selection .. " | /home/francis/Scripts/imgur.sh"
screenshot_select_file = screenshot_selection .. " ~/Pictures/Screenshots/$(date +%F-%T).png"
screenshot_select_clipboard = screenshot_selection .. " | xclip -selection clipboard -t image/png"
myscreenshotmenu = {
    { "fullscreen", {
            { "imgur", function() awful.spawn(screenshot_imgur) end },
            { "file", function() awful.util.spawn(screenshot_file) end },
            { "clipboard", function() awful.spawn(screenshot_clipboard) end }
        }
    },
    { "selection", {
            { "imgur", function() awful.util.spawn(screenshot_select_imgur) end },
            { "file", function() awful.util.spawn(screenshot_select_file) end },
            { "clipboard", function() awful.spawn(screenshot_select_clipboard) end }
        }
    }
}

mymainmenu = awful.menu({ items = {
    { "awesome", myawesomemenu, beautiful.home_icon },
    { "system", mysystemmenu },
    { "web", browser, beautiful.firefox_icon },
    { "terminal", terminal, beautiful.terminal_icon },
    { "files", filemanager, beautiful.files_icon },
    { "search", "rofi -show combi", beautiful.search_icon },
    { "rambox",
    function ()
        local matcher = function (c)
            return awful.rules.match(c, {class = 'Rambox'})
        end
        awful.client.run_or_raise("rambox", matcher)
    end,
    beautiful.telegram_icon },
    { "mail",
    function ()
        local matcher = function (c)
            return awful.rules.match(c, {class = 'Thunderbird'})
        end
        awful.client.run_or_raise("thunderbird", matcher)
    end,
    beautiful.mail_icon },
}
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a wibox for each screen and add it
mywibox = {}
myinfowibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(spacer)
    volwidget = wibox.widget.textbox()
		-- Register battery widget
		vicious.register(volwidget, vicious.widgets.volume, "$1% $2", 2, "Master")
    right_layout:add(volwidget)
    right_layout:add(spacer)
    right_layout:add(spotify_widget)
    --right_layout:add(spacer)
    batwidget = wibox.widget.textbox()
		-- Register battery widget
		vicious.register(batwidget, vicious.widgets.bat, "$1 $2% $3", 61, "BAT0")
    right_layout:add(batwidget)
    right_layout:add(spacer)
    datewidget = wibox.widget.textbox()
    vicious.register(datewidget, vicious.widgets.date, "%b %d, %R")
    right_layout:add(datewidget)
    right_layout:add(spacer)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)

    -- Create the bottom wibox
    myinfowibox[s] = awful.wibox({ position = "bottom", screen = s })
    -- Widgets that are aligned to the bottom
    --
    local bottom_layout = wibox.layout.fixed.horizontal()
    bottom_layout:add(cpuicon)
		cpuwidget = awful.widget.graph()
    cpuwidget:set_width(50)
    cpuwidget:set_background_color"#494B4F"
    cpuwidget:set_color{type = "linear", from = {0, 0}, to = {50, 0},
                      stops = {{0, "#FF5656"}, {0.5, "#88A175"}, {1, "#AECF96"}}}
		vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 5)
    bottom_layout:add(cpuwidget)
    bottom_layout:add(spacer)
    bottom_layout:add(memicon)
		memwidget = wibox.widget.textbox()
    vicious.cache(vicious.widgets.mem)
    vicious.register(memwidget, vicious.widgets.mem, "$1 ($2MiB/$3MiB)", 13)
    bottom_layout:add(memwidget)
    bottom_layout:add(spacer)
    pkgwidget = wibox.widget.textbox()
		vicious.register(pkgwidget, vicious.widgets.pkg, "$1 update", 293, "Arch")
    bottom_layout:add(pkgwidget)
    bottom_layout:add(spacer)
    wifiwidget = wibox.widget.textbox()
		vicious.register(wifiwidget, vicious.widgets.wifiiw, "${ssid} (${freq} Mhz) ${linp}%", 10, "wlp58s0")
    bottom_layout:add(wifiwidget)
    bottom_layout:add(spacer)


  -- Now bring it all together
    --local layout = wibox.layout.align.horizontal()
    --layout:set_bottom(bottom_layout)
    myinfowibox[s]:set_widget(bottom_layout)

end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

--local poppin_terminal = poppin.pop("terminal", "alacritty", "center", 1000, { border_width = 5 })
--local poppin_volume = poppin.pop("volume", "alacritty -e pulsemixer", "center", 1000, { border_width = 5 })
--local poppin_irssi = poppin.pop("irssi", "alacritty -e ssh -p 65222 francisbegyn.be", "center", 1000, { border_width = 5 })

-- Set keys
root.keys(keys.globalkeys)
-- }}}

-- {{{ Rules
local rules = require("rules")
awful.rules.rules = rules
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- screen signals
tag.connect_signal("request::screen", function(t)
    clients = t:clients()
    for s in screen do
        if s ~= t.screen and clients and next(clients) then
            t.screen = s
            t.original_tag_name = t.original_tag_name or t.name
            t.name = t.name .. "'"
            t.volatile = true
            return
        end
    end
end)

screen.connect_signal("added", function(s)
    for k,t in pairs(root.tags()) do
        if t.original_tag_name then
          -- find the new tag on the new screen
            new_tag = awful.tag.find_by_name(s, t.original_tag_name)
            if new_tag then
                t.name = t.original_tag_name
                t.original_tag_name = nil
                new_tag:swap(t)
                new_tag:delete(t, true)
            end
        end
    end
end)

-- Autostart programs
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

-- }}}
