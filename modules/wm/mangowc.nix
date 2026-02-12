{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.modules.wm.mangowc;
in {
  imports = [
    inputs.mangowc.nixosModules.mango
  ];
  options.modules.wm.mangowc.enable = lib.mkEnableOption "Whether to enable Lightweight and feature-rich Wayland compositor based on dwl.";

  config = lib.mkIf cfg.enable {
    programs.mango.enable = true;
    programs.foot.enable = true;
  };
}
