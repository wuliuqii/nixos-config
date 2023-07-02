{ pkgs, inputs, ... }:

{
  nixpkgs.system = "x86_64-linux";

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "Nixos"; # Define your hostname.
    networkmanager.enable = true;
  };
  networking.proxy.default = "http://localhost:20172";
  networking.proxy.noProxy = "127.0.0.1,localhost";
  services.v2raya.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  environment = {
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      git
      neovim
      wget
      neofetch
      exa
      xdg-utils
      pciutils
    ];
  };
  services.dbus.enable = true;

  nix = {
    settings = {
      # substituters = [
      #   "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      #   "https://cache.nixos.org/"
      # ];
      auto-optimise-store = true; # Optimise syslinks
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "23.05";
  };
}
