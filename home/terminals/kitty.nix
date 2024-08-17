{ lib, config, ... }:

lib.mkIf config.optional.terminal.kitty {
  programs = {
    kitty = {
      enable = true;
      catppuccin.enable = true;
      environment = { };
      keybindings = { };
      font.name = "JetBrains Mono";
      font.size = 16;
      settings = {
        italic_font = "auto";
        bold_italic_font = "auto";
        mouse_hide_wait = 2;
        cursor_shape = "block";
        confirm_os_window_close = 0;
        background_opacity = "0.8";
        hide_window_decorations = "yes";
      };
    };
  };
}
