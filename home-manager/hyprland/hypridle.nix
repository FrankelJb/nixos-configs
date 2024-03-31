{
  pkgs,
  config,
  ...
}: {
  services.hypridle = {
    listeners = [
      {
        timeout = 1800; # in seconds
        on-timeout = "hyprctl dispatch dpms off"; # command to run when timeout has passed
        on-resume = "hyprctl dispatch dpms on"; # command to run when activity is detected after timeout has fired.
      }
    ];
  };
}
