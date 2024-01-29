return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-symbols.nvim",
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-t>"] = trouble.open_with_trouble,
						["<C-Up>"] = actions.cycle_history_prev,
						["<C-Down>"] = actions.cycle_history_next,
					},
				},
				history = {
					path = vim.fn.stdpath("data") .. "/databases/telescope_history.sqlite3",
					limit = 100,
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set(
			"n",
			"<leader>sv",
			"<cmd>Telescope git_files<cr>",
			{ desc = "Fuzzy find files under version control" }
		)
		keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set(
			"n",
			"<leader>ss",
			":lua require('telescope.builtin').symbols({ sources = { 'emoji', 'gitmoji'}})<CR>",
			{ desc = "Find emoji" }
		)
		keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
		keymap.set(
			"n",
			"<leader>sr",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Live grep with args" }
		)
	end,
}
