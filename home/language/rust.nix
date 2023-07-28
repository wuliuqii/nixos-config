{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (fenix.complete.withComponents [
      "rustc"
      "cargo"
      "rustfmt"
      "rust-src"
      "clippy"
    ])
    rust-analyzer-nightly
    taplo
  ];

  home.file = {
    cargoConfig = {
      text = ''
        [net]
        git-fetch-with-cli = true
      '';
      target = ".cargo/config.toml";
    };
  };
}
