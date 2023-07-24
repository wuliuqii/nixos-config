{ pkgs, config, ... }:
{
  home.packages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      config = ./config.org;
      package = pkgs.emacs-pgtk;
      alwaysEnsure = true;
      # alwaysTangle = true;
      # defaultInitFile = pkgs.substituteAll {
      #   name = "default.el";
      #   src = ./init.el;
      #   inherit (config.xdg) configHome dataHome;
      # };
      extraEmacsPackages = epkgs: [
      ];
    })
  ];

  home.file = {
    ".emacs.d/init.el" = {
      source = ./init.el;
      recursive = true;
    };
    ".emacs.d/config.org" = {
      source = ./config.org;
      recursive = true;
    };
  };
}
