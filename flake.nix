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
      # kitty-overlay = final: prev: {
      #   kitty = prev.kitty.overrideAttrs (oldAttrs: {
      #     postInstall = (oldAttrs.postInstall or "") + ''
      #       substituteInPlace $out/share/applications/kitty.desktop \
      #       --replace "Exec=kitty" "Exec=sh -c \"nixGLIntel kitty\""
      #     '';
      #   });
      # };
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
	  nvim-dir = "${root-dir}" + "/nvim";
	};

	programs = rec {
          root-dir = "${self}" + "/modules/packages/programs";
	  neovim = "${root-dir}" + "/neovim.nix";
	  bash = "${root-dir}" + "/bash.nix";
	  kitty = "${root-dir}" + "/kitty.nix";
	  obs-studio = "${root-dir}" + "/obs-studio.nix";
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
