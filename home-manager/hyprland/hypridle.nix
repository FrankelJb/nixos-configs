{ inputs, pkgs, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 1800; # in seconds
          on-timeout = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms off"; # command to run when timeout has passed
          on-resume = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms on"; # command to run when timeout has passed
        }
      ];
    };
  };
}
