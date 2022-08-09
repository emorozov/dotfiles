vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'joshdick/onedark.vim'
  use 'powerman/vim-plugin-ruscmd'
  use 'rcarriga/nvim-notify'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('config.treesitter')]] }

  use { { 'nvim-orgmode/orgmode.nvim', config = [[require('config.orgmode')]] }, 'akinsho/org-bullets.nvim' }

  use 'neovim/nvim-lspconfig'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local neogit = require('neogit')
      neogit.setup {
        signs = {
          section = { "﬌", "" },
          item = { "﬌", "" },
        }
      }
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

