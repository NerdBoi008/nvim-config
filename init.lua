-- ========================================================================== --
-- ==                           BASIC SETTINGS                             == --
-- ========================================================================== --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load keymaps early
require("keymaps")

-- UI and Behavior
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.termguicolors = true -- True color support
vim.opt.signcolumn = "yes" -- Always show the sign column (prevents "jumping")
vim.opt.updatetime = 250 -- Faster completion and diagnostic display
vim.opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete
vim.opt.cursorline = true -- Highlight the line where the cursor is
vim.opt.hlsearch = false -- Clears searching highlighting
vim.opt.wrap = false -- Disable line wraping

-- Search Settings
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- ...unless search contains capitals

-- Window Splits
vim.opt.splitright = true -- New vertical splits open to the right
vim.opt.splitbelow = true -- New horizontal splits open below

-- Indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 2 -- Number of spaces for auto-indent
vim.opt.tabstop = 2 -- Number of spaces a tab counts for

-- Disable relative numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

-- Re-enable relative numbers when leaving insert mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
	callback = function()
		if vim.fn.mode() ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})

-- ========================================================================== --
-- ==                         CROSS-PLATFORM FIXES                         == --
-- ========================================================================== --

local is_windows = vim.fn.has("win32") == 1

if is_windows then
	-- Sync clipboard between Neovim and Windows
	vim.opt.clipboard = "unnamedplus"

	-- Configure PowerShell properly for Neovim
	if vim.fn.executable("pwsh") == 1 then
		vim.opt.shell = "pwsh"
		vim.opt.shellcmdflag =
			"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
		vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
		vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
		vim.opt.shellquote = ""
		vim.opt.shellxquote = ""
	end
end

-- ========================================================================== --
-- ==                         BOOTSTRAP LAZY.NVIM                          == --
-- ========================================================================== --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ========================================================================== --
-- ==                           LOAD PLUGINS                               == --
-- ========================================================================== --

-- This looks for files in ~/.config/nvim/lua/plugins/*.lua
require("lazy").setup("plugins", {
	change_detection = {
		notify = false, -- Stop showing a notification every time you save a config file
	},
})
