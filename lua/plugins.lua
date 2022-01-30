local commit = {
  telescope = "80cdb00b221f69348afc4fb4b701f51eb8dd3120",
  onedark = "e5f6772b61b4aea429db1d8cc61b8a91f467611b",
}

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
-- Packer can manage itself
use 'wbthomason/packer.nvim'
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
  config = function()
    require("nvim-tree").setup{}
  end,
}
use {
  'nvim-telescope/telescope.nvim',
  commit = commit.telescope,
  requires = { {'nvim-lua/plenary.nvim'} }
}
--
-- Put this at the end after all plugins
if packer_bootstrap then
require('packer').sync()
end
end)
