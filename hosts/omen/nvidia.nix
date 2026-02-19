{inputs, ...}: {
  imports = [
    # Include community presets
    # This config enables hp-wmi, which allows switch between cool, balanced, and performance modes
    # on the platform EC, used by power management tools like power-profile-daemon and tlp.
    inputs.nixos-hardware.nixosModules.omen-16-n0280nd

    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];

  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia = {
    dynamicBoost.enable = true;
    modesetting.enable = true;
  };

  hardware.graphics = {
    enable = true;
    # needed by nvidia-docker
    enable32Bit = true;
  };
}
