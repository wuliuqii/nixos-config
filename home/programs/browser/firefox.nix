{ ... }:

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
      };
    };
  };
}
