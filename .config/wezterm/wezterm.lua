local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = true

config.initial_cols = 120
config.initial_rows = 30

-- config.use_resize_increments = true

config.enable_kitty_graphics = true
config.front_end = "OpenGL"
config.max_fps = 120

return config
