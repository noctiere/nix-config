{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.hypr;
  cfg = config.hmModules.desktop.wm.hypr;
in {
  config = lib.mkIf (osCfg.enable && cfg.enable) {
    services.swayosd = {
      enable = true;
    };
    # home.file.".config/swayosd".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/waybar";
    # wayland.windowManager.hyprland.settings = {
    #   bindeld = [
    #     # Laptop multimedia keys for volume and LCD brightness (with OSD)
    #     " ,XF86AudioRaiseVolume, Volume up, exec, swayosd-client --output-volume 5"
    #     " ,XF86AudioLowerVolume, Volume down, exec, swayosd-client --output-volume -5"
    #     " ,XF86AudioMute, Mute, exec, swayosd-client --output-volume mute-toggle"
    #     " ,XF86AudioMicMute, Mute microphone, exec, swayosd-client --input-volume mute-toggle"
    #     " ,XF86MonBrightnessUp, Brightness up, exec, swayosd-client --brightness +10"
    #     " ,XF86MonBrightnessDown, Brightness down, exec, swayosd-client --brightness -10"

    #     # Precise 1% multimedia adjustments with Alt modifier
    #     "ALT, XF86AudioRaiseVolume, Volume up precise, exec, $osdclient --output-volume +1"
    #     "ALT, XF86AudioLowerVolume, Volume down precise, exec, $osdclient --output-volume -1"
    #     "ALT, XF86MonBrightnessUp, Brightness up precise, exec, $osdclient --brightness +1"
    #     "ALT, XF86MonBrightnessDown, Brightness down precise, exec, $osdclient --brightness -1"
    #   ];
    # };
  };
}
