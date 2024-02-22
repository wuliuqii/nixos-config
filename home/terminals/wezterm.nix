{ ... }:
{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      return {
        check_for_updates = false,
        color_scheme = 'Catppuccin Macchiato',
        default_cursor_style = 'SteadyBar',
        enable_scroll_bar = false,
        font_size = 16.0,
        hide_tab_bar_if_only_one_tab = true,
        scrollback_lines = 10000,
        enable_kitty_keyboard = true,
        window_background_opacity = 0.8,
      }
    '';
  };
}
