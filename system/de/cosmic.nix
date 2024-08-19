{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  config = lib.mkIf config.optional.cosmic {
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
  };
}
