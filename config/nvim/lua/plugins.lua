vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'dag/vim-fish'
  use 'joshdick/onedark.vim'
  use 'powerman/vim-plugin-ruscmd'
  use 'rcarriga/nvim-notify'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('config.treesitter')]] }

  use { { 'nvim-orgmode/orgmode.nvim', config = [[require('config.orgmode')]] }, 'akinsho/org-bullets.nvim' }

  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }

  use 'nvim-telescope/telescope-symbols.nvim'

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use 'neovim/nvim-lspconfig'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
      }
    end
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

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

