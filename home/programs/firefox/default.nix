{ pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "apz.overscroll.enabled" = true;
        "browser.aboutConfig.showWarning" = false;
        "general.autoScroll" = true;
        "browser.startup.homepage" = "file://${./homepage.html}";
      };
      # extraConfig = builtins.readFile "${pkgs.shyfox}/user.js";
    };
  };

  # home.file.".mozilla/firefox/${config.programs.firefox.profiles.default.path}/chrome".source = "${pkgs.shyfox}/chrome";
}
