{
  lib,
  myvars,
  ...
}: let
  userSubmodule = {name, ...}: {
    options = {
      inherit (myvars) initialHashedPassword;
      username = lib.mkOption {
        type = lib.types.str;
        default = name;
        description = "The system username";
      };
      useremail = lib.mkOption {
        type = lib.types.str;
        default = myvars.users.${name}.useremail or "";
        description = "User email address";
      };
      userfullname = lib.mkOption {
        type = lib.types.str;
        default = myvars.users.${name}.userfullname or "";
        description = "User's full name";
      };
      super-user = lib.mkOption {
        type = lib.types.bool;
        default = myvars.users.${name}.super-user or false;
        description = "Whether to add this user to super-users";
      };
    };
  };
in {
  options.modules.users = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule userSubmodule);
    default = {
      noctiere = {
        username = "noctiere";
        useremail = "potatoyear@gmail.com";
        userfullname = "Aleksey Tarakanov";
        super-user = true;
      };
    };
    description = "Attribute set of users and their metadata";
  };

  config = {
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

    # root's ssh key are mainly used for remote deployment
    users.users.root = {
      inherit (myvars) initialHashedPassword;
      # openssh.authorizedKeys.keys = myvars.mainSshAuthorizedKeys ++ myvars.secondaryAuthorizedKeys;
    };
  };
}
