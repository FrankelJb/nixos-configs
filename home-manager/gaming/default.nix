{ pkgs, config, inputs, ... }: 
{
  home.packages = with pkgs;[
    ## Utils
    gamemode
    gamescope

  ];
}
