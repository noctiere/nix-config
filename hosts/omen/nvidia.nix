{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # Include community presets
    # This config enables hp-wmi, which allows switch between cool, balanced, and performance modes
    # on the platform EC, used by power management tools like power-profile-daemon and tlp.
    inputs.nixos-hardware.nixosModules.omen-16-n0280nd

    inputs.nixos-hardware.nixosModules.common-gpu-amd
  ];

  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia = {
    dynamicBoost.enable = true; # Dynamic boost for hybrid laptops
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = false; # Don't use this with external monitor on dGPU
    };
    open = true;
    nvidiaPersistenced = true; # Keep the GPU initialized and ready
    prime = {
      offload = {
        enable = true; # Offload rendering to the NVIDIA GPU while using the integrated GPU for display
      };
      amdgpuBusId = "PCI:6:0:0"; # Run: lspci | grep -E "VGA|3D" to verify
      nvidiaBusId = "PCI:1:0:0"; # Run: lspci | grep -E "VGA|3D" to verify
    };
  };

  hardware.graphics = {
    enable = true;
    # needed by nvidia-docker
    enable32Bit = true;
  };

  # Load acpi_call for potential GPU power control
  boot.extraModulePackages = with config.boot.kernelPackages; [
    acpi_call
  ];
  boot.kernelModules = ["acpi_call"];

  boot.kernelParams = [
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

  # Prevent NVIDIA GPU from being suspended (fixes FPS drops on HDMI)
  boot.extraModprobeConfig = ''
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
  '';

  environment.systemPackages = with pkgs; [
    mesa-demos # for testing Vulkan and OpenGL
    linuxPackages.acpi_call # for testing ACPI calls
  ];

  # Environment variables for NVIDIA on Wayland
  environment.sessionVariables = {
    # Required for NVIDIA on Wayland
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";

    # For nvidia-vaapi-driver (hardware video decode)
    NVD_BACKEND = "direct";

    # VRR/G-SYNC (enable if your monitor supports it)
    # __GL_GSYNC_ALLOWED = "1";
    # __GL_VRR_ALLOWED = "1";

    # Cursor fix for some apps
    WLR_NO_HARDWARE_CURSORS = "1";

    # Explicit render device order (NVIDIA first for HDMI)
    # You may need to check which card is which with: ls -la /dev/dri/
    # AQ_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
}
