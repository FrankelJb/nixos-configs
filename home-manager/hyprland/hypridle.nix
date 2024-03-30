{
  pkgs,
  config,
  ...
}: {
  services.hypridle = {
    listeners =  [{
        timeout = 1800;                          # in seconds
        on-timeout = ] # command to run when timeout has passed
        on-resume = notify-send "Welcome back!"  # command to run when activity is detected after timeout has fired.
    }];
  '';
}
