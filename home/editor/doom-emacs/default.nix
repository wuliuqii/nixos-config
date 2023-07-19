{ inputs, pkgs, ... }:
let
  emacsPkgs = inputs.emacs-overlay.packages.${pkgs.system};
in
{
  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
  ];

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
    emacsPackage = emacsPkgs.emacsPgtk;
  };

  # services.emacs.enable = true;
}
