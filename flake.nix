{
  description = "Noctiere's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    stylix,
    home-manager,
    plasma-manager,
    spicetify,
    ...
  } @ inputs: let
    inherit (self) outputs;
    myvars = {
      username = "noctiere";
      useremail = "potatoyear@gmail.com";
      hostname = "omen";
      stateVersion = "24.11";
    };
    systems = [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-linux"
      "x86_64-darwin"
      "i686-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = {
      ${myvars.hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs myvars;};
        modules = [
          ./hosts/${myvars.hostname}
          {networking.hostName = "${myvars.hostname}";}
        ];
      };
    };
  };
}
