{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome.gnome-disk-utility
    gnome.nautilus
    neovide
    restic
    rustic-rs
    qbittorrent
    usbutils
  ];
}
