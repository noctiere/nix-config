{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.desktop.peripherals.bluetooth;
in {
  options.modules.desktop.peripherals.bluetooth.enable = lib.mkEnableOption "Enable bluetooth software";

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    environment.systemPackages = with pkgs; [
      bluetui
    ];
  };
}
