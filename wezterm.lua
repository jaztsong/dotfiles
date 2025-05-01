-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS NF")
config.font_size = 12

config.window_close_confirmation = "NeverPrompt"

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'

-- Remove the title bar from the window
config.window_decorations = "RESIZE"
config.color_scheme = '3024 (dark) (terminal.sexy)'

return config
