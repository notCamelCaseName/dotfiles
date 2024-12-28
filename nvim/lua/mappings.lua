local map = vim.keymap.set

-- Launch apps
map("n", "<C-n>", "<cmd>Neotree toggle=true<CR>", { desc = "Toggle Neotree" })

-- Terminal
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Toggle terminal in a new tab" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal in a floating window" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=10<CR>", { desc = "Toggle terminal on a window at the bottom" })
map('t', '<esc>', [[<C-\><C-n>]], { desc = "Change to normal mode" })

-- Buffer manipulations
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle to next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer" })
map("n", "<leader>x", "<cmd>bd<CR> <BAR> <cmd>bn<CR>", { desc = "Close current buffer" })

-- LSP code actions
map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "LSP code actions" })
map("n", "<leader>cn", function() vim.lsp.buf.rename() end, { desc = "Rename symbol" })
map("n", "<leader>ch", function() vim.lsp.buf.hover() end, { desc = "Show symbol information" })
map("n", "<leader>cf", function() vim.lsp.buf.format() end, { desc = "Format buffer" })
map("n", "<leader>cdc", function() vim.lsp.buf.declaration() end, { desc = "Jump to declaration" })
map("n", "<leader>cdf", function() vim.lsp.buf.definition() end, { desc = "Jump to definition" })
map("n", "<leader>ci", function() vim.lsp.buf.implementation() end, { desc = "List implementations" })
map("n", "<leader>cc", function() vim.lsp.buf.incoming_calls() end, { desc = "List incoming calls" })
