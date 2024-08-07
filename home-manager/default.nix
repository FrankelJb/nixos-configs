{ ... }:
{

  home.sessionVariables = {
    RESTIC_PASSWORD_FILE = "/run/secrets/restic";
    RUSTIC_PASSWORD_FILE = "/run/secrets/restic";
  };

  imports =
    [ (import ./ags) ]
    ++ [ (import ./atuin) ]
    ++ [ (import ./bash) ]
    ++ [ (import ./bat) ]
    ++ [ (import ./cava) ]
    ++ [ (import ./fish) ]
    ++ [ (import ./firefox) ]
    ++ [ (import ./foot) ]
    ++ [ (import ./git) ]
    ++ [ (import ./gtk) ]
    ++ [ (import ./hyprland) ]
    ++ [ (import ./kitty) ]
    ++ [ (import ./nvim) ]
    ++ [ (import ./package) ]
    ++ [ (import ./scripts) ]
    ++ [ (import ./starship) ]
    ++ [ (import ./vscodium) ]
    ++ [ (import ./zellij) ];
}
