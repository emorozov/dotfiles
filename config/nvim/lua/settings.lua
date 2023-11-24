local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

opt.colorcolumn = "+1"
opt.number = true
opt.relativenumber = true
opt.undofile = true
opt.selection = "exclusive"

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

vim.opt.listchars = "tab:➜-,space:·,trail:·,eol:¶"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

g.mapleader = " "

cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

opt.inccommand = "split"

-- Highlight yanked text for a moment
exec(
    [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]],
    false
)

opt.termguicolors = true
opt.guifont = {"JetBrains Mono", ":h10"}
cmd "colorscheme onedark"

require "lspconfig".pyright.setup {}

local function map(mode, bind, exec, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, bind, exec, opts)
end

-- Turn on Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- Don't collapse by default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99

map("n", "<leader>sf", ":Telescope git_files<CR>", {noremap = true})
map("n", "<leader><space>", ":Telescope buffers<CR>", {noremap = true})
map("n", "<leader>sg", ":Telescope live_grep<CR>", {noremap = true})
map("n", "<leader>sc", ":Telescope git_commits<CR>", {noremap = true})
map("n", "<leader>sb", ":Telescope git_branches<CR>", {noremap = true})
map("n", "<leader>sw", ":Telescope grep_string<CR>", {noremap = true})
map(
    "n",
    "<leader>ss",
    ":lua require('telescope.builtin').symbols({ sources = { 'emoji', 'gitmoji'}})<CR>",
    {noremap = true}
)
map("n", "<leader>sd", ":Telescope lsp_document_symbols<CR>", {noremap = true})
map("n", "<F10>", ":TagbarToggle<CR>", {noremap = true})
-- { "<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search Workspace Symbols" },

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "Goto Definition"})
vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete(0, false) end, {desc = 'Delete Buffer'})
