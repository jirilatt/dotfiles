vim.pack.add({ { src = 'https://codeberg.org/mfussenegger/nvim-lint' } })

local lint = require("lint")

-- Mason ships config-conventional inside its commitlint package
local mason_modules = vim.fn.stdpath("data") .. "/mason/packages/commitlint/node_modules"

lint.linters.commitlint.args = {
  "--color=false",
  "--extends", mason_modules .. "/@commitlint/config-conventional/lib/index.js",
  "--config", vim.fn.expand("~/.config/commitlint/.commitlintrc.json"),
}

lint.linters_by_ft = {
  gitcommit = { "commitlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
  callback = function() lint.try_lint() end,
})
