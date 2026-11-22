return {
  cmd = { "clangd",
	"--background-index",
	"--clang-tidy",
	"--experimental-modules-support",
	"--completion-style=detailed",
    "--header-insertion=iwyu",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
  },
}