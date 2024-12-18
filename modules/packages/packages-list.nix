{
  pkgs,
  config,
  test,
}:
let
  pkgs-list = with pkgs; [
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
    zoxide

    obsidian

    (pkgs.writeShellScriptBin "${test}" ''
      echo "Hello, ${config.home.username}!"
    '')

    nixgl.nixGLIntel
    # nixgl.auto.nixGLDefault #Impure Package

    jetbrains.idea-ultimate

    prismlauncher
    heroic

    ani-cli

    btop

  ];
in
pkgs-list
