{
  inputs,
  myvars,
  ...
}:{
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs myvars;};
    users.${myvars.username} = ../../home/${myvars.username};
  };
}