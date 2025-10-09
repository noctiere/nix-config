{
  config,
  lib,
  ...
}: let
  cfg = config.hmModules.wm.hypr.land;
in {
  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;
      extraConfig = ''
        anchor=top-right
        default-timeout=5000
        width=420
        height=110
        padding=10
        border-size=2
        font=JetBrainsMono Nerd Font Regular 13
        max-icon-size=32
        outer-margin=20

        [mode=do-not-disturb]
        invisible=true

        [mode=do-not-disturb app-name=notify-send]
        invisible=false

        [urgency=critical]
        default-timeout=0
      '';
    };
  };
}
