{
  inputs,
  pkgs,
  mylib,
  ...
}: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
    ]
    ++ map mylib.relativeToRoot ["modules/nixos/desktop.nix"];

  modules.users = {
    noctiere = {
      trusted-user = true;
    };
    marie = {};
  };

  # packages $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.alejandra.defaultPackage.${system}
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # wget
  ];

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
  system.stateVersion = "25.11";
}
