{ config, pkgs, test, filepaths, ... }:
{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = import ./packages-list.nix { inherit pkgs; inherit config; inherit test; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.neovim = import filepaths.programs.neovim filepaths;

  programs.bash = import filepaths.programs.bash;

  programs.kitty = import filepaths.programs.kitty;

  programs.obs-studio = import filepaths.programs.obs-studio;
}
