@echo off
for /f "delims=" %%i in ('chezmoi source-path') do set "SRC=%%i"
lazygit -p "%SRC%" %*
