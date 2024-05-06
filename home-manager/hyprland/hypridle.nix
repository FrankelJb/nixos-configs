{
  inputs,
  pkgs,
  ...
}: {
  services.hypridle = {
    listeners = [
      {
        timeout = 1800; # in seconds
        onTimeout = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms off"; # command to run when timeout has passed
        onResume = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms on"; # command to run when timeout has passed
      }
    ];
  };
}
