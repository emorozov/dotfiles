local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  "folke/which-key.nvim",
  "dag/vim-fish",
  "joshdick/onedark.vim",
  "neovim/nvim-lspconfig",
  {
    "numToStr/Comment.nvim",
    init = function()
      require('Comment').setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    init = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
      }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
		tag = "v0.9.1",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "sql",
        "rust",
        "go",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
  },


  "nvim-telescope/telescope-symbols.nvim",

  { 
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        }
      }
    }
  },

  { "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require('telescope').load_extension('fzf')
    end
  },

  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local neogit = require('neogit')
      neogit.setup {
        signs = {
          section = { "﬌", "" },
          item = { "﬌", "" },
        }
      }
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
})

-- return require('packer').startup(function()
--   use 'wbthomason/packer.nvim'
--   use 'dag/vim-fish'
--   use 'joshdick/onedark.vim'
--   use 'powerman/vim-plugin-ruscmd'
--   use 'rcarriga/nvim-notify'
--   use 'ledger/vim-ledger'
--   use 'SidOfc/mkdx'
--
--   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('config.treesitter')]] }
--
--   use { { 'nvim-orgmode/orgmode.nvim', config = [[require('config.orgmode')]] }, 'akinsho/org-bullets.nvim' }
--
--   use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
--
--   use 'nvim-telescope/telescope-symbols.nvim'
--
--   use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
--
--   use 'neovim/nvim-lspconfig'
--
--   use {
--     'numToStr/Comment.nvim',
--     config = function()
--       require('Comment').setup()
--     end,
--   }
--
--
--
--   if packer_bootstrap then
--     require('packer').sync()
--   end
-- end)
--
