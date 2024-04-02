{...}: {
  services = {
    dbus.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    openssh.enable = true;
    udisks2.enable = true;
  };
}
