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
      };
    };
  };
}
