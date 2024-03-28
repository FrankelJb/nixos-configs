{ pkgs, config, ... }: {
  home.packages = with pkgs; [ hyprpaper ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.config/wallpaper/default.png
    wallpaper = ,~/.config/wallpaper/default.png
    ipc=true
    splash=false
  '';
}
