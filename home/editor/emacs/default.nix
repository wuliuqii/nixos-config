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
  home.packages = with pkgs; [
    (emacsWithPackagesFromUsePackage {
      config = ./config.org;
      package = pkgs.emacs-pgtk;
      alwaysEnsure = true;
      extraEmacsPackages = epkgs: [
        epkgs.use-package
        pkgs.emacsPackages.tree-sitter
        (pkgs.emacsPackages.tree-sitter-langs.withPlugins (p: pkgs.emacsPackages.tree-sitter-langs.plugins ++ [
          p.tree-sitter-markdown
          p.tree-sitter-elisp
          p.tree-sitter-toml
        ]))
      ];
    })
  ];

  home.file = {
    ".emacs.d/init.el" = {
      source = tangledConfig;
      recursive = true;
    };
  };
}
