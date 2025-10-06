{
  pkgs,
  myvars,
  inputs,
  ...
}: {
  # nix
  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";

  # dconf
  programs.dconf.enable = true;

  # hardware accelerated graphics driver
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # external monitor
  hardware.i2c.enable = true;

  # packages $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.alejandra.defaultPackage.${system}
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    ddcutil
  ];

  # bluetooth
  hardware.bluetooth.enable = true;

  # network
  networking.networkmanager.enable = true;

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "${myvars.stateVersion}";
}
