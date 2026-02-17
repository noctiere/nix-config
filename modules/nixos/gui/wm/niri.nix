{
  config,
  lib,
  ...
}: let
  cfg = config.modules.gui.wm.niri;
in {
  options.modules.gui.wm.niri.enable = lib.mkEnableOption "Whether to enable Niri.";

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
