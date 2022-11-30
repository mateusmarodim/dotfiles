local status, packer = pcall(require, 'packer')
if (not status) then
	print('Packer not installed')
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Auto close brackets, etc
	use 'rstacruz/vim-closer'

	-- Markdown previewer
--[[	use ({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	]]

	use ({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})
end)
