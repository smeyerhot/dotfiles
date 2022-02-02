local commit = {
  telescope = "80cdb00b221f69348afc4fb4b701f51eb8dd3120",
  onedark = "e5f6772b61b4aea429db1d8cc61b8a91f467611b",
  nvim_lspconfig = "e7df7ecae0b0d2f997ea65e951ddbe98ca3e154b",
  comment = "22e71071d9473996563464fde19b108e5504f892",
  nvim_tree = "2dfed89af7724f9e71d2fdbe3cde791a93e9b9e0",
  nvim_treesitter = "cc89dda2410f5aa9160f45a6acd4db0ee26fe632",
  packer = "7182f0ddbca2dd6f6723633a84d47f4d26518191",
  plenary = "563d9f6d083f0514548f2ac4ad1888326d0a1c66",
}

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
-- Packer can manage itself
use {
  'wbthomason/packer.nvim',
  commit = commit.packer,
}
use {
  'navarasu/onedark.nvim',
  commit = commit.onedark,
  config = function()
    require('onedark').setup {
      style = 'darker'
    }
  end,
}
use {
  'kyazdani42/nvim-tree.lua',
  commit = commit.nvim_tree,
  config = function()
    require("nvim-tree").setup{}
  end,
}
use {
  'nvim-telescope/telescope.nvim',
  commit = commit.telescope,
  requires = { {'nvim-lua/plenary.nvim'} }
}

use { 
    "neovim/nvim-lspconfig",
}

use {
  "nvim-treesitter/nvim-treesitter",
  -- run = ":TSUpdate",
  commit = commit.nvim_treesitter,
  config = function()
    require('nvim-treesitter.configs').setup {
            -- One of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = "maintained",

      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- List of parsers to ignore installing
      ignore_install = {},

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { "c", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      }
    }
  end
}
use {"akinsho/toggleterm.nvim"}
use {'fatih/vim-go'}
use {
  'numToStr/Comment.nvim',
  config = function()
      require('Comment').setup()
  end
}
--
-- Put this at the end after all plugins
if packer_bootstrap then
require('packer').sync()
end
end)
