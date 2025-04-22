local wezterm = require("wezterm")
local success, wal_colors = pcall(dofile, os.getenv("HOME") .. "/.cache/wal/colors-wez.lua")

return {
  -- font = wezterm.font("BlexMono Nerd Font Light", {
  --   weight = "Bold",
  -- }),

  font = wezterm.font("JetBrainsMono NF", {
    weight = "Medium",
  }),

  colors = success and wal_colors or nil,

  font_size = 11,
  window_close_confirmation = "NeverPrompt",
  enable_tab_bar = false,

  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20,
  },
}
