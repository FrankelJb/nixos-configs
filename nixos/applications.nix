{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    duf
    gnome.gnome-disk-utility
    gnome.nautilus
    neovide
    restic
    rustic-rs
    qbittorrent
    usbutils
  ];
}
