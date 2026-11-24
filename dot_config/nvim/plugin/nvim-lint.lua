vim.pack.add({ { src = 'https://codeberg.org/mfussenegger/nvim-lint' } })

local lint = require("lint")

lint.linters.commitlint.args = { "--color=false" }

lint.linters_by_ft = {
  gitcommit = { "commitlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
  callback = function() lint.try_lint() end,
})
