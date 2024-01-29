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
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      catppuccin-fcitx5
      # https://github.com/iDvel/rime-ice/issues/554
      (fcitx5-rime.override {
        librime = (pkgs.librime.overrideAttrs (old: {
          buildInputs = old.buildInputs ++ [ lua5_4 ];
        })).override {
          plugins = with pkgs; [ librime-lua ];
        };
        rimeDataPkgs = [
          (rime-ice.override {
            enableUnihan = true;
          })
          fcitx5-pinyin-moegirl
          fcitx5-pinyin-zhwiki
        ];
      })
    ];
  };
  environment.pathsToLink = [ "/share/fcitx5" ];

  sops.age.keyFile = "/home/${config.machine.userName}/.config/sops/age/keys.txt";

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

  nixpkgs.system = "x86_64-linux";
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      substituters = [
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://cache.nixos.org/"
      ];
      trusted-users = [ "${user}" ];
      auto-optimise-store = true; # Optimise syslinks
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
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
