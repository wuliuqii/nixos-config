{ lib, config, ... }:

lib.mkIf config.optional.terminal.foot {
  catppuccin.foot.enable = true;
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "${config.profile.font}:size=16";
        box-drawings-uses-font-glyphs = "yes";
        pad = "0x0 center";
        selection-target = "clipboard";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3;
      };

      cursor = {
        style = "beam";
        beam-thickness = 1;
      };
    };
  };
}
