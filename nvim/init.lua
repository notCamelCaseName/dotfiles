require("config.lazy")

vim.schedule(function()
  require "mappings"
end)

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
