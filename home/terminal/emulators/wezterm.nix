{ lib, config, ... }:

lib.mkIf config.optional.terminal.wezterm {
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      -- wezterm.gui is not available to the mux server, so take care to
      -- do something reasonable when this config is evaluated by the mux
      function get_appearance()
        if wezterm.gui then
          return wezterm.gui.get_appearance()
        end
        return 'Dark'
      end

      function scheme_for_appearance(appearance)
        if appearance:find 'Dark' then
          return 'Catppuccin Macchiato'
        else
          return 'Catppuccin Latte'
        end
      end

      return {
        check_for_updates = false,
        color_scheme = scheme_for_appearance(get_appearance()),
        default_cursor_style = 'SteadyBar',
        enable_scroll_bar = false,
        font = wezterm.font '${config.profile.font}',
        font_size = 16.0,
        hide_tab_bar_if_only_one_tab = true,
        scrollback_lines = 10000,
        enable_kitty_keyboard = true,
        window_background_opacity = 0.8,
      }
    '';
  };
}
