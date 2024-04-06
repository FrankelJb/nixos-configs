{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    usbutils
    gnome.gnome-disk-utility
    gnome.nautilus
    restic # TODO:create the secret
    qbittorrent
  ];
}
