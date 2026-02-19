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
        name: user: {
          imports = map mylib.relativeToRoot ["home/users/${name}/hosts/${myvars.hostName}.nix"];
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
}
