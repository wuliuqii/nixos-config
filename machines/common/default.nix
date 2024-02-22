{ lib
, ...
}:
with lib;
{
  options.machine = {
    userName = mkOption {
      type = types.str;
    };
    userEmail = mkOption {
      type = types.str;
    };
    hashedPassword = mkOption {
      type = types.str;
    };
    browser = mkOption {
      type = types.str;
    };
    terminal = mkOption {
      type = types.str;
    };
    editor = mkOption {
      type = types.str;
    };
    wallpaper = mkOption {
      type = types.path;
    };
    lockImage = mkOption {
      type = types.path;
    };
    shell = mkOption {
      type = types.package;
    };
  };
}
