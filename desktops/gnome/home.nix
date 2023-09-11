{ pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "kitty.desktop"
        "code.desktop"
        "yesplaymusic.desktop"
        "com.obsproject.Studio.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "bluetooth-quick-connect@bjarosze.gmail.com"
        "blur-my-shell@aunetx"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "gsconnect@andyholmes.github.io"
        "just-perfection-desktop@just-perfection"
        "pip-on-top@rafostar.github.com"
        "CoverflowAltTab@palatis.blogspot.com"
        "appmenu-color-icon@arahiko-ayami.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "batterytime@typeof.pw"
        "clipboard-indicator@Dieg0Js.github.io"
        "freq-boost-switch@metal03326"
        "gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com"
        "instantworkspaceswitcher@amalantony.net"
        "just-another-search-bar@xelad0m"
        "space-bar@luchrioh"
        "transparent-top-bar@zhanghai.me"
        "transparent-window-moving@noobsai.github.com"
        "vertical-workspaces@G-dH.github.com"
        "quake-mode@repsac-by.github.com"
        "widgets@aylur"
        "runcat@kolesnikov.se"
        "horizontal-workspace-indicator@tty2.io"
        # "tophat@fflewddur.github.io"
        # "pop-shell@system76.com"
        # "paperwm@hedning:matrix.org"
        # "apps-menu@gnome-shell-extensions.gcampax.github.com"
        # "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        # "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        # "places-menu@gnome-shell-extensions.gcampax.github.com"
        "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
        # "user-theme@gnome-shell-extensions.gcampax.github.com"
        # "window-list@gnome-shell-extensions.gcampax.github.com"
        # "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "24h";
      color-scheme = "prefer-dark";
      enable-hot-corners = true;
      clock-show-weekday = true;
      enable-animations = true;
      gtk-theme = "Nordic";
      # icon-theme = "Nordzy";
      cursor-theme = "Nordzy-cursors";
      font-name = "JetBrainsMono Nerd Font 12";
      toolkit-accessibility = false;
      show-battery-percentage = true;
    };
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      # picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.webp";
      # picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.webp";
      # primary-color = "#3071AE";
      # secondary-color = "#000000";

      picture-uri = "file://${../../wallpaper/nordic-wall.jpg}";
      picture-uri-dark = "file://${../../wallpaper/nordic-wall.jpg}";
    };
    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      # picture-options = "zoom";
      # picture-uri = "file://${../../wallpaper/ign_wave.png}";
    };
    "org/gnome/desktop/peripherals.touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
    "org/gnome/desktop/peripherals.mouse" = {
      natural-scroll = true;
    };
    "org/gnome/desktop/privacy" = {
      report-technical-problems = "false";
    };
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };
    "org/gnome/desktop/search-providers" = {
      disable-external = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      theme = "Nordic";
    };

    "org/gnome/desktop/wm/keybindings" = {
      cycle-group = "@as [ ]";
      cycle-group-backward = "@as [ ]";
      cycle-panels = "@as [ ]";
      cycle-panels-backward = "@as [ ]";
      cycle-windows = "@as [ ]";
      cycle-windows-backward = "@as [ ]";

      move-to-monitor-down = "@as [ ]";
      move-to-monitor-left = "@as [ ]";
      move-to-monitor-right = "@as [ ]";
      move-to-monitor-up = "@as [ ]";

      move-to-workspace-left = "@as [ ]";
      move-to-workspace-right = "@as [ ]";
      switch-applications = "@as [ ]";
      switch-applications-backward = "@as [ ]";
      switch-group = "@as [ ]";
      switch-group-backward = "@as [ ]";
      switch-input-source = "@as [ ]";
      switch-input-source-backward = "@as [ ]";
      switch-panels = "@as [ ]";
      switch-panels-backward = "@as [ ]";

      close = [ "<Super>q" ];
      toggle-fullscreen = [ "<Super>f" ];
      toggle-maximized = [ "<Super>m" ];
      show-desktop = [ "<Super>d" ];
      switch-to-workspace-1 = [ "<Alt>1" ];
      switch-to-workspace-2 = [ "<Alt>2" ];
      switch-to-workspace-3 = [ "<Alt>3" ];
      switch-to-workspace-4 = [ "<Alt>4" ];
      switch-to-workspace-5 = [ "<Alt>5" ];
      switch-to-workspace-6 = [ "<Alt>6" ];
      switch-to-workspace-7 = [ "<Alt>7" ];
      switch-to-workspace-8 = [ "<Alt>8" ];
      switch-to-workspace-9 = [ "<Alt>9" ];
      switch-to-workspace-10 = [ "<Alt>0" ];
      switch-to-workspace-left = [ "<Alt>," ];
      switch-to-workspace-right = [ "<Alt>." ];
      switch-to-workspace-up = [ "<Alt>-" ];
      switch-to-workspace-down = [ "<Alt>=" ];
    };



    "org/gnome/login-screen" = {
      enable-fingerprint-authentication = true;
      enable-password-authentication = true;
      enable-smartcard-authentication = false;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "open-terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>b";
      command = "firefox";
      name = "open-firefox";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>e";
      command = "nautilus";
      name = "open-file-browser";
    };

    "org/gnome/shell/extensions/aylurs-widgets" = {
      background-clock = false;
      background-clock-x-offset = 130;
      background-clock-y-offset = 105;
      battery-bar = false;
      dash-board = false;
      dash-links-names = [ "chatgpt" "youtube" "gmail" "claude" "github" ];
      dash-links-urls = [ "https://chat.openai.com/" "https://www.youtube.com/" "https://www.gmail.com/" "https://claude.ai/" "https://www.github.com/" ];
      date-menu-tweaks = false;
      dynamic-panel = true;
      media-player = false;
      notification-indicator = false;
      power-menu = false;
      quick-settings-tweaks = false;
      stylish-osd = false;
      window-headerbar = false;
      workspace-indicator = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      blur = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = false;
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      disable-down-arrow = false;
      display-mode = 0;
      history-size = 20;
      notify-on-copy = true;
      strip-text = true;
      toggle-menu = [ "<Super><Shift>v" ];
    };

    "org/gnome/shell/extensions/coverflowalttab" = {
      desaturation-factor = 0.25;
      dim-factor = 0.25;
      easing-function = "ease-out-cubic";
      hide-panel = true;
      icon-has-shadow = false;
      icon-style = "Classic";
      offset = 0;
      perspective-correction-method = "None";
      position = "Bottom";
      switcher-style = "Coverflow";
    };

    "org/gnome/shell/extensions/freq-boost-switch" = {
      boost = false;
    };


    "org/gnome/shell/extensions/just-another-search-bar" = {
      command-delimiters = [ "+" "+" "+" ];
      command-id = 3;
      command-names = [ "google" "yandex" "bing" ];
      command-templates = [ "xdg-open https://www.google.com/search?q=#" "xdg-open https://yandex.ru/search/?text=#" "xdg-open https://cn.bing.com/search?q=#" ];
      command-wildcards = [ "#" "#" "#" ];
      open-search-bar-key = [ "<Alt><Super>f" ];
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      activities-button = true;
      alt-tab-small-icon-size = 0;
      alt-tab-window-preview-size = 0;
      animation = 3;
      app-menu = true;
      app-menu-icon = true;
      app-menu-label = true;
      background-menu = true;
      clock-menu = true;
      controls-manager-spacing-size = 0;
      dash = true;
      dash-icon-size = 0;
      dash-separator = true;
      double-super-to-appgrid = true;
      gesture = true;
      hot-corner = false;
      keyboard-layout = true;
      osd = true;
      panel = true;
      panel-arrow = true;
      panel-button-padding-size = 0;
      panel-corner-size = 0;
      panel-icon-size = 18;
      panel-in-overview = true;
      panel-indicator-padding-size = 0;
      panel-size = 0;
      power-icon = true;
      ripple-box = true;
      search = true;
      show-apps-button = true;
      startup-status = 1;
      switcher-popup-delay = true;
      theme = true;
      top-panel-position = 0;
      window-demands-attention-focus = false;
      window-picker-icon = true;
      window-preview-caption = false;
      window-preview-close-button = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-popup = true;
      workspace-switcher-should-show = false;
      workspace-switcher-size = 0;
      workspace-wrap-around = false;
      workspaces-in-app-grid = true;
    };

    "org/gnome/shell/extensions/space-bar/behavior" = {
      position = "left";
      position-index = 0;
      scroll-wheel = "panel";
      show-empty-workspaces = false;
      smart-workspace-names = false;
    };

    "org/gnome/shell/extensions/space-bar/shortcuts" = {
      enable-move-to-workspace-shortcuts = true;
    };

    "org/gnome/shell/extensions/vertical-workspaces" = {
      always-show-win-titles = true;
      animation-speed-factor = 100;
      app-grid-page-width-scale = 100;
      center-app-grid = false;
      close-ws-button-mode = 2;
      dash-icon-scroll = 2;
      dash-position = 0;
      enable-page-shortcuts = false;
      overlay-key-secondary = 3;
      overview-bg-blur-sigma = 0;
      overview-mode = 0;
      panel-position = 0;
      panel-visibility = 0;
      profile-name-1 = "GNOME 3";
      profile-name-2 = "GNOME 40+ - Bottom Hot Edge";
      profile-name-3 = "Hot Corner Centric - Top Left Hot Corner";
      profile-name-4 = "Dock Overview - Bottom Hot Edge";
      search-fuzzy = true;
      search-view-animation = 4;
      search-width-scale = 150;
      show-bg-in-overview = true;
      show-search-entry = false;
      show-ws-preview-bg = false;
      smooth-blur-transitions = false;
      startup-state = 0;
      win-preview-icon-size = 0;
      ws-max-spacing = 358;
      ws-sw-popup-mode = 0;
      ws-thumbnail-scale-appgrid = 13;
      ws-thumbnails-full = false;
      ws-thumbnails-position = 4;
      wst-position-adjust = 1;
    };

    "org/gnome/shell/extensions/bluetooth-quick-connect" = {
      show-battery-icon-on = true;
      show-battery-value-on = true;
    };

    "org/gnome/shell/extensions/pip-on-top" = {
      stick = true;
    };

    "com/github/repsac-by/quake-mode" = {
      quake-mode-always-on-top = true;
      quake-mode-animation-time = 0.10;
      quake-mode-focusout = false;
      quake-mode-halign = "right";
      quake-mode-height = 70;
      quake-mode-hide-from-overview = false;
      quake-mode-tray = false;
      quake-mode-valign = "bottom";
      quake-mode-width = 60;
    };

    "com/github/repsac-by/quake-mode/accelerators" = {
      quake-mode-accelerator-1 = [ "<Super>k" ];
    };

    "com/github/repsac-by/quake-mode/apps" = {
      app-1 = "kitty.desktop";
    };

    # "org/gnome/shell/extensions/pop-shell" = {
    #   active-hint = true;
    #   tile-by-default = true;
    # };
  };

  home.packages = with pkgs; [
    gnomeExtensions.auto-move-windows
    gnomeExtensions.transparent-top-bar
    gnomeExtensions.color-app-menu-icon-for-gnome-40
    gnomeExtensions.just-another-search-bar
    gnomeExtensions.coverflow-alt-tab
    gnomeExtensions.battery-time-2
    gnomeExtensions.removable-drive-menu
    gnomeExtensions.just-perfection
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator-2
    gnomeExtensions.workspace-indicator-2
    gnomeExtensions.bluetooth-quick-connect
    gnomeExtensions.transparent-window-moving
    gnomeExtensions.gsconnect
    gnomeExtensions.space-bar
    gnomeExtensions.disable-workspace-switch-animation-for-gnome-40
    gnomeExtensions.vertical-workspaces
    gnomeExtensions.pip-on-top
    gnomeExtensions.fuzzy-app-search
    gnomeExtensions.frequency-boost-switch
    gnomeExtensions.quake-mode
    gnomeExtensions.aylurs-widgets
    gnomeExtensions.paperwm
    gnomeExtensions.pop-shell
    gnomeExtensions.runcat
    gnomeExtensions.tophat
  ];
}
