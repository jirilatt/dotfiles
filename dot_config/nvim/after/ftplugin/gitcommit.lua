vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = { 51, 73 }
vim.opt_local.spell = true

vim.fn.matchadd("ErrorMsg", [[\%1l^.\{50}\zs.\+]])           -- subject past 50
vim.fn.matchadd("ErrorMsg", [[\%>2l^\%([^#].\{71}\)\zs.\+]]) -- body past 72