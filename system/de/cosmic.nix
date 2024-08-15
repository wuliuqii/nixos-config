{ inputs, ... }:
{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
