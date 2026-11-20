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

  extraPackages = with pkgs; [
    imagemagick
    ghostscript
    ffmpeg
  ];
}
