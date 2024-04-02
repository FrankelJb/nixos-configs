{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    usbutils
    gnome.gnome-disk-utility
    gnome.nautilus
  ];
}
