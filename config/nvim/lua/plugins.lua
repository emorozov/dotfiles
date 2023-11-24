local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        "folke/which-key.nvim",
        "dag/vim-fish",
        "joshdick/onedark.vim",
        "neovim/nvim-lspconfig",
        {
            "numToStr/Comment.nvim",
            init = function()
                require("Comment").setup()
            end
        },
        {
            "nvim-lualine/lualine.nvim",
            init = function()
                require("lualine").setup {
                    options = {
                        icons_enabled = false,
                        theme = "onedark",
                        component_separators = "|",
                        section_separators = ""
                    }
                }
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            tag = "v0.9.1",
            opts = {
                highlight = {enable = true},
                indent = {enable = true},
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
                    "dockerfile",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>"
                    }
                },
                textobjects = {
                    move = {
                        enable = true,
                        goto_next_start = {["]f"] = "@function.outer", ["]c"] = "@class.outer"},
                        goto_next_end = {["]F"] = "@function.outer", ["]C"] = "@class.outer"},
                        goto_previous_start = {["[f"] = "@function.outer", ["[c"] = "@class.outer"},
                        goto_previous_end = {["[F"] = "@function.outer", ["[C"] = "@class.outer"}
                    }
                }
            }
        },
        "nvim-telescope/telescope-symbols.nvim",
        {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            tag = "0.1.4",
            dependencies = {"nvim-lua/plenary.nvim"},
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
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end
        },
        {
            "TimUntersberger/neogit",
            dependencies = {"nvim-lua/plenary.nvim"},
            config = function()
                local neogit = require("neogit")
                neogit.setup {
                    signs = {
                        section = {"﬌", ""},
                        item = {"﬌", ""}
                    }
                }
            end
        },
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup()
            end
        },
        "f-person/git-blame.nvim",
        {
            "preservim/tagbar",
            config = function()
                vim.g.tagbar_autofocus = 1
                vim.g.tagbar_show_data_type = 1
            end,
        },
        {
            "nvim-tree/nvim-tree.lua",
            init = function()
                require("nvim-tree").setup()
            end
        },
        "nvim-tree/nvim-web-devicons",
        {
            "Pocco81/auto-save.nvim",
            init = function()
                require("auto-save").setup()
            end
        },
        {
            "s1n7ax/nvim-window-picker",
            event = "VeryLazy",
            keys = function(_, keys)
                local pick_window = function()
                    local picked_window_id = require("window-picker").pick_window()
                    if picked_window_id ~= nil then
                        vim.api.nvim_set_current_win(picked_window_id)
                    end
                end

                local swap_window = function()
                    local picked_window_id = require("window-picker").pick_window()
                    if picked_window_id ~= nil then
                        local current_winnr = vim.api.nvim_get_current_win()
                        local current_bufnr = vim.api.nvim_get_current_buf()
                        local other_bufnr = vim.api.nvim_win_get_buf(picked_window_id)
                        vim.api.nvim_win_set_buf(current_winnr, other_bufnr)
                        vim.api.nvim_win_set_buf(picked_window_id, current_bufnr)
                    end
                end

                local mappings = {
                    {"-", pick_window, desc = "Pick window"},
                    {"pw", swap_window, desc = "Swap picked window"}
                }
                return vim.list_extend(mappings, keys)
            end,
            opts = {
                hint = "floating-big-letter",
                show_prompt = false,
                filter_rules = {
                    include_current_win = true,
                    bo = {
                        filetype = {"notify", "noice"},
                        buftype = {}
                    }
                }
            }
        },
        {
            "echasnovski/mini.bufremove",
            opts = {},
        },
        {
          "hrsh7th/nvim-cmp",
          dependencies = { 
            "hrsh7th/cmp-nvim-lsp"
          },
      }
    }
)

