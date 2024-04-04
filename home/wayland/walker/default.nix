{ ... }:
{
  programs.walker = {
    enable = true;
    runAsService = true;
    style = builtins.readFile ./style.css;
    config = {
      terminal = "foot";
      activation_mode.disabled = true;
      modules = [
        {
          name = "applications";
          prefix = "";
        }
        {
          name = "websearch";
          prefix = "?";
        }
        {
          name = "switcher";
          prefix = "/";
        }
        {
          name = "hyprland";
          prefix = ".";
        }
        {
          name = "clipboard";
          prefix = ",";
        }
      ];
    };
  };
}
