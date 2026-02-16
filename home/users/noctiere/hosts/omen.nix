{mylib, ...}: {
  imports =
    map mylib.relativeToRoot [
      "home/base"
      "home/modules"
    ]
    ++ [
      ../base
    ];

  hmModules = {
    desktop = {
      gui = {
        editors = {
          zed-editor.enable = true;
        };
        launchers.walker.enable = true;
        terminal.wezterm.enable = true;
        browsers.firefox.enable = true;
      };
      wm = {
        hypr = {
          enable = true;
          # sunset.enable = true;
        };
        # niri.enable = true;
        # mangowc.enable = true;
      };
    };

    theme = {
      stylix = {
        enable = true;
        image = ../wallpapers/close-up-view-volcano-erupting-with-hot-lava.jpg;
      };
    };
    # programs = {
    #   vscodium.enable = true;
    #   zed-editor = {
    #     enable = true;
    #     extensions = ["toml" "codebook" "kanagawa-themes" "everforest-theme"];
    #     fontSize = 16;
    #     fontFamily = "JetBrainsMono Nerd Font";
    #   };
    # };
  };
}
