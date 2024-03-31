{inputs, ...}: {
  imports =
    [(import ./hyprland.nix)]
    ++ [(import ./config.nix)]
    ++ [(import ./hypridle.nix)]
    ++ [(import ./hyprpaper.nix)]
    ++ [(import ./variables.nix)]
    ++ [inputs.hyprland.homeManagerModules.default];
}
