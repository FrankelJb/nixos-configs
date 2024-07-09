{ inputs, pkgs, ... }:
let
  resumeScript = pkgs.writeShellScript "resume-script" ''
    ${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms on
    ags -b hypr quit && ags -b hypr
  '';

  timeout = 1800;
in
{
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          inherit timeout;
          on-timeout = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms off"; # command to run when timeout has passed
          on-resume = resumeScript.outPath;
        }
      ];
    };
  };
}
