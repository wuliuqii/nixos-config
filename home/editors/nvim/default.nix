{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    # copilot chat dependency
    extraLuaPackages = luaPkgs: with luaPkgs; [ tiktoken_core ];
  };

  home.packages = with pkgs; [ neovide ];
}
