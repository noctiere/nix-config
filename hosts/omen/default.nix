{
  inputs,
  pkgs,
  myvars,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.omen-16-n0280nd
    inputs.nixos-hardware.nixosModules.common-gpu-amd

    inputs.home-manager.nixosModules.home-manager

    ./audio.nix
    ./system.nix
    ../../modules
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${myvars.username} = {
    isNormalUser = true;
    description = "${myvars.username}";
    extraGroups = ["networkmanager" "wheel" "i2c"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEyXm3drT7Qw7ZqILihFvfj6KvK7KrOc2RI0wI+pFdJW potatoyear@gmail.com"
    ];
    packages = with pkgs; [
      telegram-desktop
      mesa-demos
      # thunderbird
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs myvars;};
    users.${myvars.username} = import ../../home/${myvars.username};
  };
}
