{
  config,
  lib,
  ...
}: let
  cfg = config.modules.gui.wm.gnome;
in {
  options.modules.gui.wm.gnome.enable = lib.mkEnableOption "GNOME";

  config = lib.mkIf cfg.enable {
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };
}
