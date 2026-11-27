{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.statuscol-nvim
  ];

  extraConfigLua = ''
    local builtin = require("statuscol.builtin")

    require("statuscol").setup({
      relculright = true,

      segments = {
        -- Diagnostic signs: first column
        {
          sign = {
            namespace = { "diagnostic" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
          },
        },

        {
          text = { " " },
          condition = {
            function()
              local has_diagnostics = #vim.diagnostic.get(0) > 0
              local git = vim.b.gitsigns_status_dict

              local has_gitsigns = git ~= nil
                and ((git.added or 0) + (git.changed or 0) + (git.removed or 0)) > 0

              return has_diagnostics and has_gitsigns
            end
          },
        },

        -- Git signs: second column
        {
          sign = {
            namespace = { "gitsigns" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
          },
        },

        -- Line numbers
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
        },
      },
    })
  '';
}
