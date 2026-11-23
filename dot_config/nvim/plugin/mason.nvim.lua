vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})
require("mason").setup()
require("mason-lspconfig").setup()

-- Buffer-local LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
  callback = function(args)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = args.buf, desc = "Format buffer" })
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
  callback = function(args)
    if #vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" }) == 0 then
      return
    end
    if vim.g.disable_autoformat or vim.b[args.buf].disable_autoformat then
      return
    end
    vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
  end,
})