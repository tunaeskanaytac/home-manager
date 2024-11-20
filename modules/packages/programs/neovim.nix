{ filepaths, pkgs }:
let
  nvim = filepaths.dotfiles.nvim-dir;
in
{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
	
	plugins = with pkgs.vimPlugins; [
		# COLORSCHEMES
		gruvbox-material
		catppuccin-nvim
		kanagawa-nvim

		nvim-treesitter.withAllGrammars
		nvim-cmp

		leap-nvim
		plenary-nvim
		mini-nvim

		which-key-nvim
	];

	extraPackages = with pkgs; [
		ripgrep
	];
  extraLuaConfig = ''
    ${builtins.readFile (nvim + "/options.lua")}
		${builtins.readFile (nvim + "/keymaps.lua")}
		${builtins.readFile (nvim + "/plugins.lua")}
  '';
}
