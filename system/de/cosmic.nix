{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  config = lib.mkIf config.optional.cosmic {
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;

    environment.systemPackages = with pkgs; [
      cosmic-ext-applet-clipboard-manager
      cosmic-ext-tweaks
    ];

    # environment.cosmic.excludePackages = with pkgs; [
    #   cosmic-edit
    #   cosmic-term
    #   cosmic-applibrary
    #   cosmic-store
    #   cosmic-reader
    # ];
  };
}
