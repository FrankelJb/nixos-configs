{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    duf
    gnome.gnome-disk-utility
    gnome.nautilus
    hexchat
    monero-gui
    mullvad-vpn
    mullvad-browser
    neovide
    restic
    rustic-rs
    pavucontrol
    qbittorrent
    typst
    typst-lsp
    usbutils
    veracrypt
    yq-go
  ];
  services.mullvad-vpn.enable = true;
}
