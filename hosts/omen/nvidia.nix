{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include community presets
    # This config enables hp-wmi, which allows switch between cool, balanced, and performance modes
    # on the platform EC, used by power management tools like power-profile-daemon and tlp.
    # https://github.com/NixOS/nixos-hardware/blob/master/omen/16-n0280nd/default.nix
    # inputs.nixos-hardware.nixosModules.omen-16-n0280nd

    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate

    inputs.nixos-hardware.nixosModules.common-gpu-amd

    inputs.nixos-hardware.nixosModules.common-gpu-nvidia

    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-pc-laptop
  ];

  # Enables ACPI platform profiles
  boot = lib.mkIf (lib.versionAtLeast config.boot.kernelPackages.kernel.version "6.1") {
    kernelModules = ["hp-wmi"];
  };

  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia = {
    dynamicBoost.enable = true; # Dynamic boost for hybrid laptops
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = false; # Don't use this with external monitor on dGPU
    };
    open = true;
    prime = {
      amdgpuBusId = "PCI:6:0:0"; # Run: lspci | grep -E "VGA|3D" to verify
      nvidiaBusId = "PCI:1:0:0"; # Run: lspci | grep -E "VGA|3D" to verify
    };
  };

  hardware.graphics = {
    enable = true;
    # needed by nvidia-docker
    enable32Bit = true;
  };
}
