{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerdfonts
    (pkgs.nerdfonts.override {fonts = ["CascadiaCode" "FiraCode" "JetBrainsMono"];})
    pkgs.twemoji-color-font
    pkgs.noto-fonts-emoji
  ];

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 9;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["lavender"];
        size = "compact";
        # tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
