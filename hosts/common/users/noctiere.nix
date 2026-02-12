
{
  config,
  inputs,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.noctiere = {
    isNormalUser = true;
    description = "noctiere";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [
    ];
  };
  
  home-manager.users.noctiere = ../../../home/noctiere/${config.networking.hostName}.nix;
}
