{ config, pkgs, test, ... }:
{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    libreoffice
    git
    lazygit
    gh
    obsidian
    kitty

    (pkgs.writeShellScriptBin "${test}" ''
      echo "Hello, ${config.home.username}!"
    '')

    nixgl.nixGLIntel
    # Impure Package
    # nixgl.auto.nixGLDefault

    jetbrains.idea-ultimate

  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
