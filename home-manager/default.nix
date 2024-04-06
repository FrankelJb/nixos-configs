{...}: {
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "inode/directory" = ["org.gnome.Nautilus.desktop"];
    };
    defaultApplications = {
      "inode/directory" = ["org.gnome.Nautilus.desktop"];
    };
  };
  imports =
    [(import ./ags)]
    ++ [(import ./anyrun)]
    ++ [(import ./atuin)]
    ++ [(import ./bash)]
    ++ [(import ./bat)]
    ++ [(import ./cava)]
    ++ [(import ./fish)]
    ++ [(import ./firefox)]
    ++ [(import ./foot)]
    ++ [(import ./git)]
    ++ [(import ./gtk)]
    ++ [(import ./hyprland)]
    ++ [(import ./kitty)]
    ++ [(import ./nvim)]
    ++ [(import ./package)]
    ++ [(import ./scripts)]
    ++ [(import ./starship)]
    ++ [(import ./vscodium)]
    ++ [(import ./zellij)];
}
