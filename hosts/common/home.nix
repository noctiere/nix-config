{
  inputs,
  ...
}:{
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs;};
  };
}
