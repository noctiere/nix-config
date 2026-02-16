{
  config,
  lib,
  myvars,
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

      extraGroups =
        [
          user.username
          # "wheel"
          "users"
          "networkmanager"
        ]
        ++ (
          if cfgUsers.${user.username}.super-user
          then ["wheel"]
          else []
        )
        ++ (
          if config.hardware.i2c.enable
          then ["input" "video" "i2c"]
          else []
        );
    })
    cfgUsers;
}
