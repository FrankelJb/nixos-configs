{inputs, ...}: {
  imports =
    [(import ./hyprland.nix)]
    ++ [(import ./config.nix)]
    ++ [(import ./hyprpaper.nix)]
    ++ [(import ./variables.nix)];
}
