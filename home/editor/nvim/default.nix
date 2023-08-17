{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };

  # home.file.".config/nvim".source = ./config;
}
