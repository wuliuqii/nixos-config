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

    btop = {
      enable = true;

      settings = {
        color_theme = "dracula";
        theme_background = false;
        update_ms = 500;
      };
    };

    eza.enable = true;
  };

  home = {
    packages = with pkgs; [
      # search
      fd
      ripgrep

      # image viewer
      imv

      # misc
      killall
      lazygit
      tokei
      tree
      jaq
      gitu
    ];
  };
}
