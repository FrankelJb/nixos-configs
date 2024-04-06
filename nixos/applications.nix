{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    usbutils
    gnome.gnome-disk-utility
    gnome.nautilus
    restic
    rustic-rs
    qbittorrent
  ];
}
