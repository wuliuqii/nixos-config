{ lib, pkgs, ... }:
{
  networking = {
    hostName = "nixos";
    proxy = {
      default = "http://localhost:20172";
      noProxy = "127.0.0.1,localhost";
    };
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };
  };

  services = {
    # network discover, mDNS
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        domain = true;
        userServices = true;
      };
    };

    resolved.enable = true;

    v2raya.enable = true;
  };

  # after sleep, v2raya will be not working,
  # so we need to restart it
  powerManagement.resumeCommands = ''
    ${pkgs.systemd}/bin/systemctl restart v2raya.service
  '';

  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
