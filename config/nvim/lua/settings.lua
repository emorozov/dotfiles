local cmd = vim.cmd
local opt = vim.opt

opt.colorcolumn = "+1"
opt.number = true
opt.relativenumber = true
opt.undofile = true
opt.selection = "exclusive"

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.listchars = "tab:➜-,space:·,trail:·,eol:¶"
opt.clipboard = "unnamedplus"

cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

cmd([[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]])

opt.inccommand = "split"

-- Highlight yanked text for a moment
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPre", {
	pattern = "*",
	callback = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "<buffer>",
			once = true,
			callback = function()
				vim.cmd(
					[[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
				)
			end,
		})
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '•',
  nbsp = '+',
}

vim.api.nvim_create_user_command("TrimWhitespace", function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", save_cursor)
end, { nargs = 0 })
vim.keymap.set('n', '<Leader>wt', "<CMD>TrimWhitespace<CR>", { desc = "Trim trailing whitespace" })

opt.termguicolors = true

-- Turn on Folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- Don't collapse by default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99

vim.keymap.set('n', 'ZZ', ':xa<CR>', { noremap = true, silent = true, desc = "Save unsaved buffers and quit all windows" })

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set(
	"n",
	"<leader>ts",
	[[:s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<cr>:nohl<cr>]],
	{ desc = "Change CamelCase to snake_case" }
)

vim.keymap.set("n", "<leader>/", ":nohl<CR>", { desc = "Clear search highlights" })

opt.guifont = { "FiraMono Nerd Font", ":h12" }

if vim.g.neovide == true then
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.15)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.15)
  end)

  -- vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy system clipboard" })
  -- vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste system clipboard" })
end
