{
  imports = [
    ./users.nix
    ./home.nix

    ../../modules
  ];

  # hardware accelerated graphics driver
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # network
  networking.networkmanager.enable = true;

  # nix
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
}