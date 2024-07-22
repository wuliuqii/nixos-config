{ config, pkgs, inputs, ... }:
let
  user = config.machine.userName;
in
{
  imports = [
    ./font.nix
    ./hardware.nix
    ./security.nix
    ./services.nix
    ./virtualisation.nix
    ./desktop.nix
    ./network.nix
  ];

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        catppuccin-fcitx5
        (fcitx5-rime.override {
          librime = librime-with-plugins;
          rimeDataPkgs = [
            rime-ice
            fcitx5-pinyin-moegirl
            fcitx5-pinyin-zhwiki
          ];
        })
      ];
    };
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  programs.fish.enable = true;
  environment = {
    shells = with pkgs; [ fish ];

    systemPackages = with pkgs; [
      git
      wget
      nitch
      pciutils
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
  };

  nix = {
    settings = {
      substituters = [
        # "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://mirrors.cernet.edu.cn/nix-channels/store"
        # "https://cache.nixos.org/"
      ];
      trusted-users = [ "${user}" ];
      auto-optimise-store = true; # Optimise syslinks
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.git;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes auto-allocate-uids
      accept-flake-config   = true
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "24.05";
  };
}
