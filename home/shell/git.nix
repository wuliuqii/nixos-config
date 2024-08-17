{ config, ... }:
{
  programs = {
    git = {
      inherit (config.machine) userName userEmail;
      enable = true;

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
