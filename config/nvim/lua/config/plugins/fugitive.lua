return {
  "tpope/vim-fugitive",
  lazy = true,
	keys = {
			{ '<leader>gd', '<cmd>Gdiffsplit<CR>', desc = 'Git diff' },
			{ '<leader>gb', '<cmd>Git blame<CR>', desc = 'Git blame' },

  },
 	cmd = {
		"G",
		"Git",
    "Gedit",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "Glgrep",
    "GMove",
    "GRename",
    "GDelete",
    "GBrowse",
	},
}
