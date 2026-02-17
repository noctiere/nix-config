{
  config,
  lib,
  ...
}: let
  cfg = config.modules.gui.wm.cosmic;
in {
  options.modules.gui.wm.cosmic.enable = lib.mkEnableOption "COSMIC";

  config = lib.mkIf cfg.enable {
    # Enable the COSMIC Desktop Environment.
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
  };
}
