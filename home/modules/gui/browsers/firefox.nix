{
  config,
  lib,
  myvars,
  ...
}: let
  cfg = config.hmModules.gui.browsers.firefox;
in {
  options.hmModules.gui.browsers.firefox = {
    enable = lib.mkEnableOption "Whether to enable Firefox";
  };

  config = lib.mkIf cfg.enable {
    stylix.targets.firefox.profileNames = builtins.attrNames myvars.users;

    programs.firefox = {
      enable = true;
    };
  };
}
