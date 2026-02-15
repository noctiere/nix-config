{
  config,
  lib,
  myvars,
  mylib,
  ...
}: let
  cfgUsers = config.modules.users;
in {
  users.users =
    lib.mapAttrs (name: user: {
      inherit (myvars) initialHashedPassword;

      home = "/home/${user.username}";
      description = user.userfullname;
      isNormalUser = true;

      extraGroups = [
        user.username
        "users"
        "wheel"
        "networkmanager"
      ];
    })
    cfgUsers;
}
