{ config, ... }:
{
  programs = {
    git = {
      inherit (config.machine) userName userEmail;
      enable = true;

      delta = {
        enable = true;
        catppuccin.enable = true;
        options = {
          navigate = true;
          interactive.keep-plus-minus-markers = false;
        };
      };

      lfs.enable = true;
      extraConfig = {
        pull = {
          rebase = false;
        };
        feature = {
          manyFiles = true;
        };
        index = {
          skipHash = false;
        };
      };
    };

    lazygit = {
      enable = true;
      catppuccin.enable = true;
      settings = {
        theme.nerdFontsVersion = 3;
        update.method = false;
        disableStartupPopups = true;
      };
    };
  };
}
