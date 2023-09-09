{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisplayBookmarksToolbar = true;
        Preferences = {
          "browser.toolbars.bookmarks.visibility" = "never";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
      };
    };
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "file://${./homepage.html}";
      };
      userChrome = import ./userChrome.nix;
    };
  };
}
