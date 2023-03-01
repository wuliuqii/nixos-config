{ pkgs, config, ... }: {
  xdg.configFile."nvim".source = ./nvim;

  home.packages = with pkgs; [
    lua-language-server
    stylua
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = false;
    withRuby = false;
    withNodeJs = false;
    withPython3 = false;
  };
}
