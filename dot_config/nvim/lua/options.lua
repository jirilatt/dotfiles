vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"

vim.opt.expandtab = true   -- expand tab input with spaces characters
vim.opt.smartindent = true -- syntax aware indentations for newline inserts
vim.opt.tabstop = 2        -- num of space characters per tab
vim.opt.shiftwidth = 2     -- spaces per indentation level

local isWin = vim.loop.os_uname().sysname:find("Windows") and true or false
if isWin then
  local usePwsh = vim.fn.executable("pwsh") == 1
  vim.o.shell = usePwsh and "pwsh" or "powershell"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellpipe = "> %s 2>&1"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""

  if usePwsh then
    vim.o.shellcmdflag = vim.o.shellcmdflag .. " $PSStyle.OutputRendering = 'PlainText';"
    vim.env.__SuppressAnsiEscapeSequences = "1"
  end

  vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    callback = function()
      local cwd = vim.fn.getcwd():gsub("/", "\\")
      vim.api.nvim_ui_send('\27]9;9;"' .. cwd .. '"\27\\')
    end,
  })
end
