return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        -- Existing clangd options can go here
        -- For example, if you have any specific settings for clangd
        -- ...
      },
    },
    setup = {
      clangd = function(_, opts)
        -- Ensure opts.cmd exists and append the flag
        opts.cmd = opts.cmd or { "clangd" }
        table.insert(opts.cmd, "--header-insertion=never")
      end,
    },
  },
}
