{
  pkgs,
  config,
  lib,
  ...
}:

lib.mkIf config.optional.dev.rust {
  home.packages = with pkgs; [
    # rustc
    # cargo
    # rust-analyzer
    rustup
    cargo-nextest

    taplo
    vscode-extensions.vadimcn.vscode-lldb.adapter
  ];

  home.file = {
    cargoConfig = {
      text = ''
        [source.crates-io]
        replace-with = 'rsproxy-sparse'
        [source.rsproxy]
        registry = "https://rsproxy.cn/crates.io-index"
        [source.rsproxy-sparse]
        registry = "sparse+https://rsproxy.cn/index/"
        [registries.rsproxy]
        index = "https://rsproxy.cn/crates.io-index"
        [net]
        git-fetch-with-cli = true
      '';
      target = ".cargo/config.toml";
    };
  };

  home.sessionVariables = {
    RUSTUP_DIST_SERVER = "https://rsproxy.cn";
    RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup";
  };
}
