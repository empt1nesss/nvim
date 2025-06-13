vim.opt["cmdheight"] = 0
vim.opt["cursorline"] = true

vim.cmd [[ 
  augroup ilikecursorline
    autocmd VimEnter * :highlight CursorLine guibg=#252434
  augroup END
]]

