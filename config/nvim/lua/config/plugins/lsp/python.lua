return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python"
	},
	config = function(_, opts)
		local venv_selector = require("venv-selector")

		opts.changed_venv_hooks = {
			venv_selector.hooks.pyright,
		}

		venv_selector.setup(opts)
	end,
	init = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			desc = "Auto select virtualenv Nvim open",
			pattern = "*",
			callback = function()
				local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")

				if venv == "" then
					local names = { "venv", ".venv", "env", ".env" }
					for _, name in ipairs(names) do
						if venv ~= "" then
							break
						end

						venv = vim.fn.finddir(name, vim.fn.getcwd())
					end
				end

				if venv ~= "" then
					require("venv-selector").retrieve_from_cache()
				end
			end,
			once = true,
		})

		return true
	end,
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
    { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
  },
	-- opts = {
	--   dap_enabled = true,
	-- },
}
