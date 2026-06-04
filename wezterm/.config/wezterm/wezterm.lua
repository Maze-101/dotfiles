local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- arabic
config.bidi_enabled = true
config.bidi_direction = 'LeftToRight'

-- 1. Apply the Gruvbox Dark theme
config.color_scheme = 'Gruvbox Dark (Gogh)'

-- 2. Override the specific background color to #1b1b1b
config.colors = {
  background = '#1b1b1b',
}

-- 3. Adjust padding (left, right, top, bottom)
config.window_padding = {
  left = '12px',
  right = '12px',
  top = '12px',
  bottom = '12px',
}

-- 4. Keybindings for zooming with Alt + i / Alt + o
config.keys = {
  {
    key = 'i',
    mods = 'ALT',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = 'o',
    mods = 'ALT',
    action = wezterm.action.DecreaseFontSize,
  },
  -- Optional: Alt + 0 to reset the zoom level
  {
    key = '0',
    mods = 'ALT',
    action = wezterm.action.ResetFontSize,
  },
}

return config