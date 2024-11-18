{ config, pkgs, test, ... }:
{
  xdg.enable = true;
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  
  xdg.desktopEntries.kitty = {
    type = "Application";
    name = "kitty";
    genericName = "Terminal Emulator";
    comment = "Fast, feautre-rich, GPU based terminal";
    startupNotify = true;
    exec = "nixGLIntel kitty";
    icon = "kitty";
    categories = [ "System" "TerminalEmulator" ];
  };

  xdg.desktopEntries.obs = {
    name = "OBS Studio";
    genericName = "Streaming/Recording Software";
    comment = "Free and Open Source Streaming/Recording Software";
    exec = "nixGLIntel obs";
    icon = "com.obsproject.Studio";
    terminal = false;
    type = "Application";
    categories = [ "AudioVideo" "Recorder" ];
    startupNotify = true;
  };
}
