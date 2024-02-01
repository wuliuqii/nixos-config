{ pkgs, ... }:
{
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };

    skim = {
      enable = true;
      enableFishIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'eza --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };

    yazi.enable = true;
    btop.enable = true;
    eza.enable = true;
  };

  home = {
    packages = with pkgs; [
      # search
      fd
      ripgrep

      # image viewer
      imv

      # build
      # gcc
      just
      clang
      gnumake

      # misc
      showmethekey
      killall
      lazygit
      cloc
      tokei
      tree
      jaq
      github-copilot-cli
    ];
  };
}
