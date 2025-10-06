{
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include community presets
    inputs.nixos-hardware.nixosModules.omen-16-n0280nd
    inputs.nixos-hardware.nixosModules.common-gpu-amd

    ../common
    
    ./config.nix
    ./system.nix
  ];
}
