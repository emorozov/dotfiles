vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'joshdick/onedark.vim'
  use 'powerman/vim-plugin-ruscmd'
  use 'rcarriga/nvim-notify'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('config.treesitter')]] }
  use { { 'nvim-orgmode/orgmode.nvim', config = [[require('config.orgmode')]] }, 'akinsho/org-bullets.nvim' }
  use 'neovim/nvim-lspconfig'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

