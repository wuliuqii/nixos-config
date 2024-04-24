{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    # copilot chat dependency
    extraLuaPackages = luaPkgs: with luaPkgs; [
      tiktoken_core
    ];
  };
}
