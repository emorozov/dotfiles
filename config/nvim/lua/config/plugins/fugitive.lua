return {
  "tpope/vim-fugitive",
  lazy = true,
	keys = {
			{ '<leader>gd', '<cmd>Gdiffsplit<CR>', desc = 'Git diff' },
			{ '<leader>gb', '<cmd>Git blame<CR>', desc = 'Git blame' },

  },
 	cmd = {
		"G",
		"GBrowse",
		"GDelete",
		"GMove",
		"GRemove",
		"GRename",
		"GUnlink",
		"Gcd",
		"Gclog",
		"Gdiffsplit",
		"Gdrop",
		"Gedit",
		"Ggrep",
		"Ghdiffsplit",
		"Git",
		"Glcd",
		"Glgrep",
		"Gllog",
		"Gpedit",
		"Gread",
		"Gsplit",
		"Gtabedit",
		"Gvdiffsplit",
		"Gvsplit",
		"Gwq",
		"Gwrite",
	},
}
