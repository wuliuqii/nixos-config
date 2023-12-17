{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
    interactiveShellInit = ''
      set fish_greeting
      fish_config theme choose "Catppuccin Macchiato"
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
      lg = "lazygit";
      n = "nitch";
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

  xdg.configFile = {
    "fish/functions/f.fish".text = import ./functions/f.nix;
    "fish/themes/Catppuccin Macchiato.theme".source = "${pkgs.catppuccin-fish}/share/fish/tools/web_config/themes/Catppuccin Macchiato.theme";
  };
}
