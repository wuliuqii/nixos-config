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
      l = "exa";
      ls = "exa";
      la = "exa -a";
      lla = "exa -la";
      vim = "hx";
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
}

