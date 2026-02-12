{
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.modules.wm;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    wayland.windowManager.hyprland.settings = {
      "$terminal" = "wezterm";
      "$fileManager" = "nautilus";
      "$menu" = "hyprlauncher";
      "$browser" = "firefox";

      "$mainMod" = "SUPER";

      bindd = [
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        "$mainMod, Q, Open Terminal, exec, $terminal"
        "$mainMod, E, Open file manager, exec, $fileManager"
        # "$mainMod, R, Launch Apps, exec, $menu"
        "$mainMod, B, Open browser, exec, $browser"
        "$mainMod SHIFT, B, Open private Browser, exec, $browser --private"
        "$mainMod, C, Close window, killactive"
        # "$mainMod, M, Exit Hyprland, exit"
        "$mainMod, V, Toggle floating, togglefloating"
        "$mainMod, F, Force full screen, fullscreenstate, 2 0"
        "$mainMod SHIFT, P, Pseudo window, pseudo # dwindle"
        "$mainMod SHIFT, J, Toggle split, togglesplit # dwindle"
        "$mainMod, SPACE, Launch apps, exec, $menu"

        # Move focus with mainMod + h/j/k/l
        "$mainMod, H, Move focus left, movefocus, l"
        "$mainMod, L, Move focus right, movefocus, r"
        "$mainMod, K, Move focus up, movefocus, u"
        "$mainMod, J, Move focus down, movefocus, d"
        
        # Move active window with mainMod + h/j/k/l
        "$mainMod SHIFT, H, Move window left, movewindow, l"
        "$mainMod SHIFT, L, Move window right, movewindow, r"
        "$mainMod SHIFT, K, Move window up, movewindow, u"
        "$mainMod SHIFT, J, Move window down, movewindow, d"

        # Switch workspaces with mainMod + [0-9]
        # "$mainMod, 1, workspace, 1"
        # "$mainMod, 2, workspace, 2"
        # "$mainMod, 3, workspace, 3"
        # "$mainMod, 4, workspace, 4"
        # "$mainMod, 5, workspace, 5"
        # "$mainMod, 6, workspace, 6"
        # "$mainMod, 7, workspace, 7"
        # "$mainMod, 8, workspace, 8"
        # "$mainMod, 9, workspace, 9"
        # "$mainMod, 0, workspace, 10"
        "$mainMod, code:10, Switch to workspace 1, workspace, 1"
        "$mainMod, code:11, Switch to workspace 2, workspace, 2"
        "$mainMod, code:12, Switch to workspace 3, workspace, 3"
        "$mainMod, code:13, Switch to workspace 4, workspace, 4"
        "$mainMod, code:14, Switch to workspace 5, workspace, 5"
        "$mainMod, code:15, Switch to workspace 6, workspace, 6"
        "$mainMod, code:16, Switch to workspace 7, workspace, 7"
        "$mainMod, code:17, Switch to workspace 8, workspace, 8"
        "$mainMod, code:18, Switch to workspace 9, workspace, 9"
        "$mainMod, code:19, Switch to workspace 10, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        # "$mainMod SHIFT, 1, movetoworkspace, 1"
        # "$mainMod SHIFT, 2, movetoworkspace, 2"
        # "$mainMod SHIFT, 3, movetoworkspace, 3"
        # "$mainMod SHIFT, 4, movetoworkspace, 4"
        # "$mainMod SHIFT, 5, movetoworkspace, 5"
        # "$mainMod SHIFT, 6, movetoworkspace, 6"
        # "$mainMod SHIFT, 7, movetoworkspace, 7"
        # "$mainMod SHIFT, 8, movetoworkspace, 8"
        # "$mainMod SHIFT, 9, movetoworkspace, 9"
        # "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT, code:10, Move window to workspace 1, movetoworkspace, 1"
        "$mainMod SHIFT, code:11, Move window to workspace 2, movetoworkspace, 2"
        "$mainMod SHIFT, code:12, Move window to workspace 3, movetoworkspace, 3"
        "$mainMod SHIFT, code:13, Move window to workspace 4, movetoworkspace, 4"
        "$mainMod SHIFT, code:14, Move window to workspace 5, movetoworkspace, 5"
        "$mainMod SHIFT, code:15, Move window to workspace 6, movetoworkspace, 6"
        "$mainMod SHIFT, code:16, Move window to workspace 7, movetoworkspace, 7"
        "$mainMod SHIFT, code:17, Move window to workspace 8, movetoworkspace, 8"
        "$mainMod SHIFT, code:18, Move window to workspace 9, movetoworkspace, 9"
        "$mainMod SHIFT, code:19, Move window to workspace 10, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, Toggle special workspace, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, Move window to special workspace, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, Scroll active workspace forward, workspace, e+1"
        "$mainMod, mouse_up, Scroll active workspace backward, workspace, e-1"

        # Tab between workspaces
        "$mainMod, TAB, Next workspace, workspace, e+1"
        "$mainMod SHIFT, TAB, Previous workspace, workspace, e-1"
        "$mainMod CTRL, TAB, Former workspace, workspace, previous"

        # Cycle through applications on active workspace
        "ALT, Tab, Cycle to next window, cyclenext"
        "ALT SHIFT, Tab, Cycle to prev window, cyclenext, prev"
        "ALT, Tab, Reveal active window on top, bringactivetotop"
        "ALT SHIFT, Tab, Reveal active window on top, bringactivetotop"

        # Resize active window
        "SUPER, code:20, Expand window left, resizeactive, -100 0"   # - key
        "SUPER, code:21, Shrink window left, resizeactive, 100 0"    # = key
        "SUPER SHIFT, code:20, Expand window down, resizeactive, 0 100"
        "SUPER SHIFT, code:21, Shrink window up, resizeactive, 0 -100"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindmd = [
        "$mainMod, mouse:272, Move window, movewindow"
        "$mainMod, mouse:273, Resize window, resizewindow"
      ];

      # Laptop multimedia keys for volume and LCD brightness
      # bindel = [
      #   " ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      #   " ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      #   # " ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      #   " ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      #   " ,XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      #   " ,XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      # ];

      # Requires playerctl
      bindld = [
        ", XF86AudioNext, Next track, exec, playerctl next"
        ", XF86AudioPause, Pause, exec, playerctl play-pause"
        ", XF86AudioPlay, Play, exec, playerctl play-pause"
        ", XF86AudioPrev, Previous track, exec, playerctl previous"
      ];
    };
  };
}
