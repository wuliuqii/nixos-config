{ pkgs, ... }:
{
  imports = [
    ./yazi.nix
  ];

  catppuccin = {
    btop.enable = true;
    imv.enable = true;
    fzf.enable = true;
  };
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    btop = {
      enable = true;
      package = pkgs.btop.override { rocmSupport = true; };

      settings = {
        theme_background = false;
        update_ms = 500;
      };
    };

    imv = {
      enable = true;
    };

    fzf = {
      enable = true;

      enableFishIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'eza --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };

    eza.enable = true;

    mcfly = {
      enable = true;
      enableFishIntegration = true;
      fzf.enable = true;
    };
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
