local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
require('lazy').setup("eulegang.lazy")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
			}
		}
	}
})

lspconfig.rust_analyzer.setup {
	-- Server-specific settings. See `:help lspconfig-setup`
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {},
	},
	diagnostics = {
		globals = {
			"vim"
		}
	},
}

vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.clipboard = 'unnamedplus'
