{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    catppuccin.enable = true;
    functions = {
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
    interactiveShellInit = ''
      set fish_greeting
      set PATH $PATH ~/.cargo/bin
    '';
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd .././..";
      l = "eza";
      ls = "eza";
      la = "eza -a";
      lla = "eza -la";
      grep = "rg";
      cat = "bat";
      c = "clear";
      lg = "lazygit";
      vd = "neovide";
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
