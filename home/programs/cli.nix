{ pkgs, ... }:
{
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    yazi = {
      enable = true;
    };

    eza.enable = true;
  };

  home = {
    packages = with pkgs; [
      # search
      bat
      fd
      ripgrep

      # image viewer
      imv

      # build
      gcc
      just

      # misc
      showmethekey
      killall
      lazygit
      cloc
      tokei
      tree
      jaq
    ];
  };
}