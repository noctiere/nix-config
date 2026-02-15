{
  inputs,
  myvars,
  lib,
  mylib,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    backupFileExtension = "home-manager.backup";

    extraSpecialArgs = {inherit inputs myvars mylib;};
    users =
      lib.mapAttrs (
        name: user:
          import (mylib.relativeToRoot "home/users/${name}/hosts/${myvars.hostName}.nix")
      )
      myvars.users;
  };
}
