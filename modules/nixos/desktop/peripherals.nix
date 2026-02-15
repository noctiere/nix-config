{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfgAudio = config.modules.desktop.audio;
  cfgBluetooth = config.modules.desktop.bluetooth;
  cfgPrinting = config.modules.desktop.printing;
in {
  options.modules.desktop.audio.enable = mkEnableOption "Enable audio software";
  options.modules.desktop.bluetooth.enable = mkEnableOption "Enable bluetooth software";
  options.modules.desktop.printing.enable = mkEnableOption "Enable CUPS to print documents";

  config = lib.mkMerge [
    (
      mkIf cfgAudio.enable {
        # Enable sound with pipewire.
        security.rtkit.enable = true;
        services.pulseaudio.enable = false;
        services.pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
          wireplumber.enable = true;

          # use the example session manager
          # (no others are packaged yet so this is enabled by default,
          # no need to redefine it in your config for now)
          # media-session.enable = true;
        };

        environment.systemPackages = with pkgs; [
          playerctl
          easyeffects
          pwvucontrol
        ];

        # services.mpd = {
        #   enable = true;
        #   extraConfig = ''
        #     # must specify one or more outputs in order to play audio!
        #     # (e.g. ALSA, PulseAudio, PipeWire), see next sections
        #     audio_output {
        #       type "pipewire"
        #       name "My PipeWire Output"
        #     }
        #   '';
        #   user = "${myvars.noctiere.username}";
        #   # Optional:
        #   # network.listenAddress = "any"; # if you want to allow non-localhost connections
        #   # network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
        # };
        #
        # systemd.services.mpd.environment = {
        #   # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
        #   XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.${myvars.noctiere.username}.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
        # };
      }
    )
    (lib.mkIf cfgBluetooth.enable {
      hardware.bluetooth.enable = true;
      environment.systemPackages = with pkgs; [
        bluetui
      ];
    })
    (lib.mkIf cfgPrinting.enable {
      services.printing.enable = true;
    })
  ];
}
