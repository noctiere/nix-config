{
  config,
  lib,
  ...
}: let
  cfg = config.modules.wm.niri;
in {
  options.modules.wm.niri.enable = lib.mkEnableOption "Whether to enable Niri.";

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
