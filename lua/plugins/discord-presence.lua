return {
  "IogaMaster/neocord",
  event = "VeryLazy",
  opts = function ()
    return {
      enable_line_number = false,

      editing_text = function ()
        local extension = vim.fn.expand("%:e")

        if extension ~= "" then
          return "Editing " .. extension .. " file"
        else
          return "Editing text file"
        end
      end,

        -- "Editing %t file",
      file_explorer_text = "Browsing files",
      readint_text = function ()
        local extension = vim.fn.expand("%:e")

        if extension ~= "" then
          return "Reading " .. extension .. " file"
        else
          return "Reading text file"
        end
      end,
      workspace_text = "Working in Neovim",

      main_image = "language",
      show_time = true,
    }
  end,
}
