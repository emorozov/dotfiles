return {
	"natecraddock/workspaces.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"rcarriga/nvim-notify",
	},
	event = "VeryLazy",
	config = function(_, _)
		require("telescope").load_extension("workspaces")
		require("workspaces").setup({
			hooks = {
				open = function()
					vim.notify((" Switched to project: %s "):format(vim.fn.getcwd()))
					local local_nvimrc = vim.fn.getcwd() .. "/.nvimrc"
					if vim.secure.read(local_nvimrc) then
						vim.cmd.source(local_nvimrc)
					end
				end,
			},
		})
	end,
}
