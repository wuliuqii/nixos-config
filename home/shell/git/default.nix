{ config, ... }:
{
  programs = {
    git = {
      inherit (config.machine) userName userEmail;
      enable = true;
    };
  };
}
