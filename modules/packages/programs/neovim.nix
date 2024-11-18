filepaths :
let
  nvim = filepaths.dotfiles.nvim-dir;
in
{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraLuaConfig = ''
    ${builtins.readFile (nvim + "/options.lua")}
  '';
}
