return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
		"rcarriga/nvim-notify",
	},
	lazy = true,
	config = function(_, opts)
		local venv_selector = require("venv-selector")

		opts.changed_venv_hooks = {
			venv_selector.hooks.pyright,
		}

		venv_selector.setup(opts)
	end,
	init = function()
		vim.api.nvim_create_autocmd("Filetype", {
			pattern = { "python" },
			callback = function()
				require("venv-selector").retrieve_from_cache()
			end,
		})

		return true
	end,
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
	-- opts = {
	--   dap_enabled = true,
	-- },
}
