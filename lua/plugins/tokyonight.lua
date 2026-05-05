return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = { 
      style = "moon",
      on_highlights = function(hl, c)
          --hl.Comment = { fg = "#47f50f", italic = true}
          --hl.LineNr = { fg = "#ffffff" }
          hl.CursorLineNr = { fg = "#ff9e64", bold = true }
          --hl.Todo = { fg = "#222436", bg = "#ffc777" } -- original color
          hl.Todo = { fg = "#000000", bg = "#47f50f" }
          --hl.Visual = { bg = "#ffffff" }
    end,
  },
}
