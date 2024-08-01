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
      catppuccin.enable = true;
      config = {
        pager = "less -FR";
      };
    };

    skim = {
      enable = true;
      catppuccin.enable = true;
      enableFishIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'eza --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };

    btop = {
      enable = true;
      catppuccin.enable = true;
      settings = {
        theme_background = false;
        update_ms = 500;
      };
    };

    imv = {
      enable = true;
      catppuccin.enable = true;
    };

    eza.enable = true;
  };

  home = {
    packages = with pkgs; [
      # search
      fd
      ripgrep

      # misc
      killall
      tokei
      tree
      jaq
    ];
  };
}
