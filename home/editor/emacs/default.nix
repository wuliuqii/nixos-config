{ pkgs, ... }:
let
  tangledConfig = pkgs.stdenv.mkDerivation {
    name = "hm-emacs-tangled-config";

    src = ./config.org;
    phases = "buildPhase installPhase";

    buildPhase = ''
      cp $src config.org
      ${pkgs.emacs-pgtk}/bin/emacs --batch -l org --eval "(org-babel-tangle-file \"config.org\")"
    '';

    installPhase = ''
      cp config.el $out
    '';
  };
in
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackagesFromUsePackage {
      config = ./config.org;
      package = pkgs.emacs-pgtk;
      alwaysEnsure = true;
    };
  };

  home.file = {
    ".emacs.d/init.el" = {
      source = tangledConfig;
      recursive = true;
    };
  };
}
