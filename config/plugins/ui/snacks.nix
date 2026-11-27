{ pkgs, ... }:
{
  plugins.snacks = {
    enable = true;

    settings = {
      picker.enabled = true;
      image = {
        enabled = true;
        doc = {
          enabled = true;
          inline = true;
          float = true;
          max_width = 80;
          max_height = 40;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = ''
        function()
          Snacks.picker.grep({
            cwd = vim.fn.getcwd(),
            hidden = true,
          })
        end
      '';
      options = {
        desc = "Grep project";
        silent = true;
      };
    }
  ];

  extraPackages = with pkgs; [
    imagemagick
    ghostscript
    ffmpeg
    ripgrep
    fd
  ];
}
