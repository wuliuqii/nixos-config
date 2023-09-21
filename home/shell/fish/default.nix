{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
    interactiveShellInit = ''
      set fish_greeting
      # neofetch
    '';
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd .././..";
      l = "eza";
      ls = "eza";
      la = "eza -a";
      lla = "eza -la";
      vim = "nvim";
      grep = "rg";
      c = "clear";
      top = "btop";
      lg = "lazygit";
      n = "neofetch";
    };
    plugins = [
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];
  };

  home.file.".config/fish/conf.d/nord.fish".text = import ./conf.d/nord_theme.nix;
  home.file.".config/fish/functions/f.fish".text = import ./functions/f.nix;
}
