return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    { "nvim-neotest/nvim-nio" },
    {
        "mfussenegger/nvim-dap",
        config = function()
            require "configs.dap"
        end,
        requires = { "nvim-neotest/nvim-nio" }
    },

    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("dapui").setup()
        end,
        requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
        requires = { "mfussenegger/nvim-dap" },
    },
    {
      "elkowar/yuck.vim",
      ft = "yuck"
    },
}
