{
  description = "Noctiere's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    alejandra,
    home-manager,
    hyprland,
    hyprland-plugins,
    plasma-manager,
    stylix,
    spicetify,
    ...
  } @ inputs: let
    inherit (self) outputs;
    inherit (inputs.nixpkgs) lib;
    mylib = import ./lib { inherit lib; };
    systems = [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-linux"
      "x86_64-darwin"
      "i686-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    nixosConfigurations = {
      omen = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs mylib;
          vars.hostname = "omen";
        };
        modules = [
          ./hosts/omen
        ];
      };
    };
    
    # Format the nix code in this flake
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
