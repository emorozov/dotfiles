local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

opt.colorcolumn = '119'
opt.number = true
opt.relativenumber = true
opt.undofile = true
opt.selection = 'exclusive'

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

vim.opt.listchars = "tab:➜-,space:·,trail:·,eol:¶"

cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

g.mapleader = ' '

cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

opt.inccommand = 'split'

-- Highlight yanked text for a moment
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

opt.termguicolors = true
opt.guifont = { "JetBrains Mono", ":h10" }
cmd'colorscheme onedark'

require'lspconfig'.pyright.setup{}

local function map(mode, bind, exec, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, bind, exec, opts)
end

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

map('n', '<leader>sf', ':Telescope find_files<CR>', { noremap = true })
map('n', '<leader>sg', ':Telescope live_grep<CR>', { noremap = true })
map('n', '<leader>sc', ':Telescope git_commits<CR>', { noremap = true })
map('n', '<leader>sb', ':Telescope git_branches<CR>', { noremap = true })
map('n', '<leader>sw', ':Telescope grep_string<CR>', { noremap = true })
map('n', '<leader>ss', ':lua require(\'telescope.builtin\').symbols({ sources = { \'emoji\', \'gitmoji\'}})<CR>', { noremap = true })
