{inputs, ...}: {
  imports =
    [(import ./ags)]
    ++ [(import ./bash)]
    ++ [(import ./bat)]
    ++ [(import ./cava)]
    ++ [(import ./fish)]
    ++ [(import ./firefox)]
    ++ [(import ./git)]
    ++ [(import ./gtk)]
    ++ [(import ./hyprland)]
    ++ [(import ./kitty)]
    ++ [(import ./nvim)]
    ++ [(import ./package)]
    ++ [(import ./scripts)] # personal scripts
    ++ [(import ./starship)]
    ++ [(import ./zellij)];
}
