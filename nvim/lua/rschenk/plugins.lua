-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use '9mm/vim-closer'

  -- use 'tpope/vim-endwise' -- adds 'end' intelligently in ruby. Does not work w/ treesitter
  use 'windwp/nvim-autopairs' -- can be configured to work like endwise, works w/ treesitter
  use 'tpope/vim-eunuch' -- integration with unix commands
  use 'tpope/vim-fugitive' -- git integration
  use 'tpope/vim-projectionist' -- semantically browse projects
  use 'tpope/vim-rails' -- rails integration
  use 'tpope/vim-rake' -- rake integration
  use 'tpope/vim-repeat' -- makes . command work with fancy cmds
  use 'tpope/vim-sensible' -- run bundler through vim
  use 'tpope/vim-surround' -- surround stuff with other stuff
  use 'tpope/vim-unimpaired' -- pairs of commands that do stuff
  use 'vim-test/vim-test' -- test runner
  use 'kassio/neoterm' -- Easily re-use just one terminal window

  -- Smart and Powerful commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Better, smarter, and much faster syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat", -- For nvim 0.5, not needed once 0.6 released
    run = ":TSUpdate",
  }

  -- -- LSP and friends
  -- use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  -- use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  -- use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for LSP client
  -- use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  -- use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  -- use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Telescope is a massive fuzzy finding powerhouse
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Telescope plugin for faster fuzzy sorting
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Dash.app support
  use({ 'mrjones2014/dash.nvim', requires = { 'nvim-telescope/telescope.nvim' } })

  -- Search for strings with ripgrep
  use 'jremmen/vim-ripgrep'

  -- Color schemes
  use 'marko-cerovac/material.nvim'
  use 'folke/tokyonight.nvim'
end)
