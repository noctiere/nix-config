{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.desktop.peripherals.monitors;
in {
  options.modules.desktop.peripherals.monitors.enable = lib.mkEnableOption "Enable monitor control with ddcutil";

  config = lib.mkIf cfg.enable {
    hardware.i2c.enable = true;
    environment.systemPackages = with pkgs; [
      ddcutil
    ];
  };
}
