vim.filetype.add({
  extension = {
    vsh = "glsl",
    fsh = "glsl",
    frag = "glsl",
    vert = "glsl",
    comp = "glsl",
  },
})

vim.opt["cmdheight"] = 0
vim.opt["cursorline"] = true

vim.cmd [[ 
  augroup ilikecursorline
    autocmd VimEnter * :highlight CursorLine guibg=#252434
  augroup END
]]

vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })

vim.cmd('set tabstop=2')

