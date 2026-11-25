return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" }, -- the Lua version Neovim uses
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,   -- types for the vim.* API
          "${3rd}/luv/library", -- types for vim.uv
        },
      },
      telemetry = { enable = false },
      codeLens = {
        enable = true
      },
      hint = {
        enable = true,
        semicolon = "Disable"
      }
    },
  },
}

