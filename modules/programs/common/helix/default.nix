{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "nord";
      editor = {
        line-number = "relative";
        indent-guides.render = true;
        cursorline = true;
        true-color = true;
        color-modes = true;
        lsp.display-messages = true;
      };
      keys.normal = {
        C-s = ":w";
        C-q = ":q";
        C-o = ":open ~/.config/helix/config.toml";
        tab = ":buffer-next";
        S-tab = ":buffer-previous";
        C-h = "jump_view_left";
        C-l = "jump_view_right";
        C-k = "jump_view_up";
        C-j = "jump_view_down";
        C-x = ":bc";
      };
      keys.insert = {
        j = {
          k = "normal_mode";
        };
      };
    };
  };
}
