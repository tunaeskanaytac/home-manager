{ pkgs }:
{
  enable = true;
  shellIntegration.enableBashIntegration = true;
  font.name = "FiraCode Nerd Font";
  font.package = pkgs.fira-code-nerdfont;
}
