{
  description = "Home Manager configuration of xenonfandangon";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = { self, nixpkgs, home-manager, nixgl, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
	overlays = [ nixgl.overlay ];
      };
      test = "asd";
      filepaths = {
        home-nix = "${self}" + "/home.nix";

	dotfiles = rec {
	  root-dir = "${self}" + "/dotfiles";
	  sway-dir = "${root-dir}" + "/sway";
	};
      };
    in {
      homeConfigurations."xenonfandangon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
	extraSpecialArgs = {
          inherit test;
	  inherit filepaths;
	};
      };
    };
}
