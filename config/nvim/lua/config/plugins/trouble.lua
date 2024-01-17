return {
	"folke/trouble.nvim",
	config = true,
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open trouble window" },
		{
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			desc = "Open workspaces diagnostics in trouble",
		},
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Open document diagnostics in trouble" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Open quickfix window in trouble" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Open loclist in trouble" },
		{ "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Open LSP references in trouble" },
	},
}
