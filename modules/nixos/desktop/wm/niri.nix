{
  config,
  lib,
  ...
}: let
  cfg = config.modules.desktop.wm.niri;
in {
  options.modules.desktop.wm.niri.enable = lib.mkEnableOption "Whether to enable Niri.";

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
