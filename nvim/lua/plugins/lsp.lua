local servers = require("config.lsp")

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = servers,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
		dependencies = {
		},
		config = function()
			for _, lsp in ipairs(servers) do
				require("lspconfig")[lsp].setup {}
			end
		end,
	},
}
