local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

opt.colorcolumn = '119'
opt.number = true
opt.relativenumber = true
opt.undofile = true
opt.selection = 'exclusive'

cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

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
cmd'colorscheme onedark'

require'lspconfig'.pyright.setup{}
