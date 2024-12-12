{ config, ... }:
{
  imports = [
    ./editors
    ./programs
    ./terminal
    ./secrets
    ./wm
  ];

  home = {
    username = "${config.profile.userName}";
    homeDirectory = "/home/${config.profile.userName}";

    sessionVariables = {
      EDITOR = "${config.profile.editor}";
      BROWSER = "${config.profile.browser}";
      TERMINAL = "${config.profile.terminal}";

      QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
    };

  };

  catppuccin = {
    # enable = true;
    accent = if config.profile.darkMode then "mauve" else "flamingo";
    flavor = if config.profile.darkMode then "macchiato" else "latte";
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
