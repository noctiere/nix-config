{
  config,
  lib,
  ...
}: let
  cfg = config.modules.desktop.peripherals.printing;
in {
  options.modules.desktop.peripherals.printing.enable = lib.mkEnableOption "Enable CUPS to print documents";

  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
  };
}
