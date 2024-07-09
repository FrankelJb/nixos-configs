{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    bottom
    entr # perform action when file change
    file # Show file information
    fluxcd
    fzf # fuzzy finder
    kubectl
    lazygit
    lolcat
    lsd
    nitch # system fetch util
    nix-prefetch-github
    pipx # Install Python applications in isolated environments
    ripgrep # grep replacement
    rust-bin.stable.latest.default
    overskride
    signal-desktop
    sops
    tealdeer
    toipe # typing test in the terminal
    typescript
    cinnamon.nemo-with-extensions # file manager
    ungoogled-chromium
    yazi # terminal file manager
    youtube-dl
    gnome.zenity

    # C / C++
    gcc
    gnumake

    # Python
    python3

    gparted # partition manager
    ffmpeg
    imv # image viewer
    libnotify
    mpv # video player
    ncdu # disk space
    openssl
    pamixer # pulseaudio command line mixer
    pavucontrol # pulseaudio volume controle (GUI)
    playerctl # controller for media players
    qalculate-gtk # calculator
    unzip
    wget
    xdg-utils
    inputs.alejandra.defaultPackage.${system}
  ];
}
