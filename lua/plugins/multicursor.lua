return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_theme = "purplegray"
    vim.g.VM_mouse_mappings = 1
    vim.g.VM_maps = {
      ["Find Under"]         = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
      ["I BS"]               = "",
      ["Goto Next"]          = "]v",
      ["Goto Prev"]          = "[v",
      ["I CtrlB"]            = "<M-b>",
      ["I CtrlF"]            = "<M-f>",
      ["I Return"]           = "<S-CR>",
      ["I Down Arrow"]       = "",
      ["I Up Arrow"]         = "",
    }
  end
}
