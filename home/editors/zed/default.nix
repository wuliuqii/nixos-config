{
  lib,
  config,
  pkgs,
  ...
}:
let
  lsp-raw = import ./lsp.nix { inherit pkgs lib; };
  lsp = (lib.removeAttrs lsp-raw [ "__functor" ]);
in

lib.mkIf config.optional.dev.zed {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "toml"
      "catppuccin-icons"
      "catppuccin"
    ];

    extraPackages = with pkgs; [
      # LSP
      nixd
      nixfmt-rfc-style
      nodejs
      taplo-lsp
      vscode-langservers-extracted
    ];

    userKeymaps = (import ./keymap.nix);

    userSettings = {
      assistant = {
        default_model = {
          provider = "copilot_chat";
          model = "claude-3-7-sonnet";
        };
        version = "2";
      };
      auto_update = false;
      load_direnv = "direct";
      ui_font_size = 18;
      buffer_font_size = 20;
      ui_font_family = "MonoLisa";
      buffer_font_family = "MonoLisa";
      format_on_save = "on";
      scrollbar.show = "never";
      relative_line_numbers = true;
      jupyter.enabled = false;
      vim_mode = true;
      theme = {
        mode = "system";
        dark = "Catppuccin Macchiato";
        light = "Catppuccin Latte";
      };
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };
      icon_theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Macchiato";
      };
      toolbar = {
        breadcrumbs = true;
        quick_actions = false;
      };
      calls = {
        mute_on_join = true;
        share_on_join = false;
      };
      tabs = {
        git_status = true;
        file_icons = true;
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = false;
        show_parameter_hints = true;
        show_other_hints = true;
      };
    } // lsp;
  };
}
