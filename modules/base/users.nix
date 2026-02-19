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
  options = {
    modules.users = lib.mkOption {
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
  };

  config = {
    users.users =
      lib.mapAttrs (name: user: {
        description = user.userfullname;

        # 1. The corresponding private key must be:
        #    1. Generated locally on every trusted client via:
        #      ```bash
        #      # KDF: bcrypt with 256 rounds, takes 2s on Apple M2):
        #      # Passphrase: digits + letters + symbols, 12+ chars
        #      ssh-keygen -t ed25519 -a 256 -C "user@host" -f ~/.ssh/xxx`
        #      ```
        #    2. Never leave the device and never sent over the network.
        # 2. Or just use hardware security keys like Yubikey/CanoKey.
        openssh.authorizedKeys.keys = user.sshAuthorizedKeys;
      })
      myvars.users;
  };
}
