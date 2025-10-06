{
  myvars,
  pkgs,
  ...
}: {
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
}