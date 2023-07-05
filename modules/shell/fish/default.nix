{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
    shellAbbrs = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd .././..";
      l = "exa";
      ls = "exa";
      vim = "hx";
      grep = "rg";
      c = "clear";
      top = "btop";
      lg = "lazygit";
      j = "joshuto";
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

