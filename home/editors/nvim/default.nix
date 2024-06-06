{ pkgs, inputs, ... }: {
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly.packages.${pkgs.system}.default;
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
