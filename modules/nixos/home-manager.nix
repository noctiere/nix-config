{
  config,
  inputs,
  myvars,
  lib,
  mylib,
  ...
}: let
  cfg = config.modules.home-manager;
in {
  imports = [inputs.home-manager.nixosModules.home-manager];
  options.modules.home-manager.enable = lib.mkEnableOption "Enable Home Manager to manage user configurations";

  config = lib.mkIf cfg.enable {
    home-manager = {
      useUserPackages = true;
      backupFileExtension = "home-manager.backup";
      extraSpecialArgs = {inherit inputs myvars mylib;};

      users =
        lib.mapAttrs (
          name: user: {
            imports = map mylib.relativeToRoot ["home/users/${name}"];
            home = {
              username = name;
              homeDirectory = "/home/${name}";

              # This value determines the Home Manager release that your
              # configuration is compatible with. This helps avoid breakage
              # when a new Home Manager release introduces backwards
              # incompatible changes.
              #
              # You can update Home Manager without changing this value. See
              # the Home Manager release notes for a list of state version
              # changes in each release.
              stateVersion = "25.11";
            };
          }
        )
        myvars.users;
    };
  };
}
