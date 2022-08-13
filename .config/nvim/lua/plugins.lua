local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'ellisonleao/gruvbox.nvim' } -- ColorScheme
    use {
        'hoob3rt/lualine.nvim', -- Statusline
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'L3MON4D3/LuaSnip' -- Snippets
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-int LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'neovim/nvim-lspconfig' -- LSP
end)
