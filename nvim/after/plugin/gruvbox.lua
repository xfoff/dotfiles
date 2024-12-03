-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {
    -- Line numbers
    LineNr = { fg = "#E8E6E3" }, -- Dark gray for line numbers

    -- Visual selection
    Visual = { bg = "#b16286" }, -- Soft purple for visual selection

    -- Functions and types
    Function = { fg = "#ff007c" }, -- Pink for function names
    Type = { fg = "#8ec07c" }, -- Cyan/green for types
  },
  dim_inactive = true,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
