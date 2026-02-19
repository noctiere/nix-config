{
  config,
  lib,
  myvars,
  ...
}: {
  # Don't allow mutation of users outside the config.
  users.mutableUsers = false;

  users.groups = {
    #   "${myvars.username}" = { };
    podman = {};
    wireshark = {};
    #   # for android platform tools's udev rules
    #   adbusers = { };
    #   dialout = { };
    #   # for openocd (embedded system development)
    #   plugdev = { };
    #   # misc
    #   uinput = { };
  };

  users.users =
    # creating users from vars
    lib.mapAttrs (name: user: {
      inherit (myvars) initialHashedPassword;
      home = "/home/${user.username}";
      isNormalUser = true;
      extraGroups =
        [
          user.username
          # "wheel"
          "users"
          "networkmanager"
        ]
        ++ (
          if user.super-user
          then ["wheel"]
          else []
        )
        ++ (
          if config.hardware.i2c.enable
          then ["input" "video" "i2c"]
          else []
        );
    })
    myvars.users
    // {
      # root's ssh key are mainly used for remote deployment
      root = {
        inherit (myvars) initialHashedPassword;
        # openssh.authorizedKeys.keys = myvars.mainSshAuthorizedKeys ++ myvars.secondaryAuthorizedKeys;
      };
    };
}
