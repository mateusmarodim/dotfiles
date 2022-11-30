local settings = require("settings")
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in 'config' parameer of packer's use
-- expects the name of the config file
local function get_config(name)
	return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer...")
	vim.api.nvim_command("packadd packer.nvim")
end

local status, packer = pcall(require, 'packer')
if (not status) then
	print('Packer not installed')
	return
end

vim.cmd [[packadd packer.nvim]]

packer.init({
	enable = true,
	threshold = 0,
	max_jobs = 20,
	dispay = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Auto close brackets, etc
	use({ "rstacruz/vim-closer" })

	-- Markdown previewer
--[[	use ({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	]]

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})
end)
