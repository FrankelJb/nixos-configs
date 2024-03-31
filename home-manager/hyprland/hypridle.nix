{...}: {
  services.hypridle = {
    enable = true;
    listeners = [
      {
        timeout = 1800; # in seconds
        # TODO: replace with nix style paths
        onTimeout = "hyprctl dispatch dpms off"; # command to run when timeout has passed
        onResume = "hyprctl dispatch dpms on"; # command to run when activity is detected after timeout has fired.
      }
    ];
  };
}
