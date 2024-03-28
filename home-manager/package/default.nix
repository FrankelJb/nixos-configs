{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    rust-bin.stable.latest.default
    entr                              # perform action when file change
    file                              # Show file information 
    fzf                               # fuzzy finder
    lazygit
    lolcat
    lsd
    nitch                             # system fetch util
    nix-prefetch-github
    pipx                              # Install Python applications in isolated environments
    ripgrep                           # grep replacement
    soundwireserver                   # pass audio to android phone
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    cinnamon.nemo-with-extensions     # file manager
    yazi                              # terminal file manager
    youtube-dl
    gnome.zenity

    # C / C++
    gcc
    gnumake

    # Python
    python3

    gparted                           # partition manager
    ffmpeg
    imv                               # image viewer
    libnotify
    mpv                               # video player
    ncdu                              # disk space
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    qalculate-gtk                     # calculator
    unzip
    wget
    xdg-utils
    inputs.alejandra.defaultPackage.${system}
  ]);
}
