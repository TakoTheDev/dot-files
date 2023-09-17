local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight="DemiBold", stretch="Normal", style="Normal"})
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.7
config.use_fancy_tab_bar = false
config.keys = {
  {
    key = 'w',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'f',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.SpawnTab 'DefaultDomain',
  },
}

return config
