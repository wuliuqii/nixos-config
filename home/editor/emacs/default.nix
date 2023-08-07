{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  home.file = {
    ".config/emacs/early-init.el".source = ./early-init.el;
    ".config/emacs/init.el".source = ./init.el;
    ".config/emacs/lisp".source = ./lisp;
  };
}
