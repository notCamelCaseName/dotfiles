return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "molokai",
	globalstatus = true,
      },
      extensions = { "lazy", "mason", "neo-tree" },
    },
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        separator_style = "slant",
				close_command = "bdelete! %d | bn",
        right_mouse_command = "bdelete! %d | bn",
      },
    },
  },
}
