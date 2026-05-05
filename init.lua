vim.opt.title = true -- set terminal title
vim.opt.mouse  = 'a'  -- Enable mouse support
vim.opt.number = true -- Set line numbers
vim.opt.ruler  = true -- it's the indicator of the line and column
vim.opt.syntax = 'on' -- Enable syntax hightlighting

vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.showmatch = true -- show the matching brackets, curly braces or parenteses

vim.opt.linebreak = true -- enable line breaking
vim.opt.wrap = true -- text wrapping
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI

vim.opt.incsearch = true        -- search as characters are entered
vim.opt.hlsearch = false        -- do not highlight matches
vim.opt.ignorecase = true       -- ignore case in searches by default
vim.opt.smartcase = true        -- but make it case sensitive if an uppercase is entered
vim.opt.showbreak = "↪"
vim.opt.autoindent = true -- automatically set indent of new line
vim.opt.ttyfast = true -- faster redrawing

vim.diagnostic.enable = true
vim.diagnostic.config({ virtual_lines = true  })


-- toggle invisible characters
vim.opt.list = false
vim.opt.listchars = {
  tab = "→ ",
  eol = "↲",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}
vim.o.inccommand = 'split'  -- Preview substitutions live, as you type!

vim.o.undofile = true       -- Enable undo/redo changes even after closing and reopening a file
vim.opt.autoread = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.autowrite = true
--vim.opt.colorcolumn = "90"
vim.opt.signcolumn = "yes"

vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>dir", vim.cmd.Ex)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})


vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}




require("config.lazy")
-- require("config/custom-commands")


vim.cmd[[colorscheme tokyonight]]
