# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save', 'private': 'open -p'}

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Automatically start playing `<video>` elements. Note: On Qt < 5.11,
# this option needs a restart and does not support URL patterns.
# Type: Bool
c.content.autoplay = False

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = []

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '/home/francis/Downloads'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 45000

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Position of new tabs opened from another tab. See
# `tabs.new_position.stacking` for controlling stacking behavior.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.related = 'next'

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'left'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

# Alignment of the text inside of tabs.
# Type: TextAlignment
# Valid values:
#   - left
#   - right
#   - center
c.tabs.title.alignment = 'left'

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = '6%'

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://pomoday.app/'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'gscholar': 'https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q={}', 'g': 'https://google.com/search?q={}', 'gif': 'https://giphy.com/search/{}', 'gmaps': 'https://www.google.be/maps/search/{}+', 'maps': 'https://www.openstreetmap.org/search?query={}', 'mov': 'https://www.imdb.com/find?q={}&s=all', 'r': 'https://www.reddit.com/search?q={}', 'word': 'https://www.wordnik.com/words/{}', 'woord': 'https://woordenlijst.org/#/?q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://pomoday.app/'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = 'grey'

# Force `prefers-color-scheme: dark` colors for websites.
# Type: Bool
c.colors.webpage.prefers_color_scheme_dark = True

# Font used for the hints.
# Type: Font
c.fonts.hints = 'Terminus'

# Font used for prompts.
# Type: Font
c.fonts.prompts = 'Terminus'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = 'Terminus'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = 'Terminus'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = None

# Bindings for normal mode
config.bind(',n', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/css/solarized-dark-all-sites.css ""')
config.bind('<Alt+Shift+y>', 'spawn --detach /home/francis/Scripts/youtubeplayer.sh queue "{url}"')
config.bind('<Ctrl+Shift+b>', 'spawn --userscript getbib')
config.bind('<Ctrl+Shift+c>', 'hint links spawn --detach /home/francis/Scripts/youtubecaster.sh queue "{hint-url}"')
config.bind('<Ctrl+Shift+r>', 'spawn --userscript readability')
config.bind('<Ctrl+Shift+y>', 'hint links spawn --detach /home/francis/Scripts/youtubeplayer.sh queue "{hint-url}"')
config.bind('C', 'hint links spawn --detach /home/francis/Scripts/youtubecaster.sh single "{hint-url}"')
config.bind('Y', 'hint links spawn --detach /home/francis/Scripts/youtubeplayer.sh window "{hint-url}"')
config.bind('zl', 'spawn --userscript qute-pass --password-only')
config.bind('zol', 'spawn --userscript qute-pass --otp-only')
config.bind('zpl', 'spawn --userscript qute-pass --password-only')
config.bind('zul', 'spawn --userscript qute-pass --username-only')

# Bindings for command mode
config.bind('<Ctrl+j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl+k>', 'completion-item-focus prev', mode='command')
