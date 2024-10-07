require "nvchad.options"

require("nvim-tree").setup{
		view = {
				side = "right"
		}
}

vim.o.cursorlineopt = "both"

vim.wo.relativenumber = true
vim.wo.foldmethod = "indent"
vim.wo.foldenable = false
