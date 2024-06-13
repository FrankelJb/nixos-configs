{ inputs, ... }:
{
  imports =
    [ (import ./hyprland.nix) ]
    ++ [ (import ./config.nix) ]
    ++ [ (import ./hypridle.nix) ]
    # ++ [ (import ./hyprlock.nix) ]
    ++ [ (import ./hyprpaper.nix) ]
    ++ [ (import ./variables.nix) ];
}
