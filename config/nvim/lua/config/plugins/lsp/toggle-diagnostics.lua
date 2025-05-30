return {
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	lazy = true,
	init = function()
		require("toggle_lsp_diagnostics").init()
	end,
	keys = {
		{ "<leader>tD", "<cmd>ToggleDiag<cr>", desc = "Toggle LSP Diagnostics" },
	},
}
