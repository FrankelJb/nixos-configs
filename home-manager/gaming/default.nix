{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Utils
    gamescope
  ];
}
