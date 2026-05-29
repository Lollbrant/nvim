-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
            spec = {
                -- import your plugins
                { import = "plugins" },
            },
            -- Configure any other settings here. See the documentation for more details.
            -- colorscheme that will be used when installing plugins.
            install = { colorscheme = { "tokyonight", "habamax" } },
            -- automatically check for plugin updates
            checker = { enabled = true },
        })



vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf

        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = bufnr,
                desc = desc,
            })
        end

        -- map("n", "gd", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        -- map("n", "gr", vim.lsp.buf.references)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
		map("n", "<leader>lr", "<cmd>lsp restart<CR>")
    end,
})
