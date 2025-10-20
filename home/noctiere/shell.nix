{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    antidote = {
      enable = true;
      plugins = [
        ''
          zsh-users/zsh-syntax-highlighting
          zsh-users/zsh-autosuggestions
          zsh-users/zsh-history-substring-search
          romkatv/powerlevel10k
        ''
      ];
    };
    initContent = ''
      source ~/.dotfiles/zsh/.p10k.zsh
    '';
  };

  xdg.configFile."../.p10k.zsh".source = lib.mkForce (config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zsh/.p10k.zsh");

  programs.bash = {
    enable = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "star";
  };

  # lsd(eluxe) - better ls
  home = {
    packages = with pkgs; [ lsd ];
    shellAliases = {
      ls = "lsd -A";
      ll = "lsd -l --group-directories-first";
      la = "lsd -lA --group-directories-first";
    };
  };

  # programs.starship = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  # xdg.configFile."starship.toml".source = lib.mkForce (config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/starship.toml");
}
