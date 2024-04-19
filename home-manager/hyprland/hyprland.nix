{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    direnv
    glib
    grim
    hypridle
    hyprpicker
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    slurp
    swww
    wl-clipboard
    cliphist
    wf-recorder
    wayland
    wofi
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    # plugins = [inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo];
    plugins = [inputs.Hyprspace.packages.${pkgs.system}.Hyprspace];
    # enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
