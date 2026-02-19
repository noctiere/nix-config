{
  inputs,
  pkgs,
  ...
}: {
  # packages $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.alejandra.defaultPackage.${pkgs.stdenv.hostPlatform.system}
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # wget
  ];
}
