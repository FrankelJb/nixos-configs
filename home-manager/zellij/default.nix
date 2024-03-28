{ inputs, ... }: 
{
  programs.zellij = {
    enable = true;

  };
  xdg.configFile = {
    "zellij/config.kdl".source = ./config/config.kdl;
  };
  programs.bash.initExtra = ''
    eval "$(zellij setup --generate-auto-start bash)"
    fastfetch
    '';
}
