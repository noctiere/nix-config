{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hmModules.programs.vscodium;
in {
  options.hmModules.programs.vscodium.enable = lib.mkEnableOption "Whether to enable VSCodium is a community-driven, freely-licensed binary distribution of Microsoft's editor VS Code";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      vscodium
    ];
  };

}
