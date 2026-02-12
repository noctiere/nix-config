{
  imports = [
    ../common
    
    ./wm
    ./stylix.nix
    ./wezterm.nix
    ./shell.nix
  ];
  
  programs.home-manager.enable = true;

  home = {
    username = "noctiere";
    homeDirectory = "/home/noctiere";
    stateVersion = "25.11";
  };

  hmModules = {
    wm = {
      hypr = {
        land.enable = true;
      };
    };
    stylix = {
      enable = true;
      image = ./wallpapers/close-up-view-volcano-erupting-with-hot-lava.jpg;
    };
    programs = {
      vscodium.enable = true;
      zed-editor = {
        enable = true;
        extensions = ["toml" "codebook" "kanagawa-themes" "everforest-theme"];
        fontSize = 16;
        fontFamily = "JetBrainsMono Nerd Font";
      };
    };
  };
}
