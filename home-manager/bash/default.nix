{ inputs, ... }: 
{
  programs.bash = {
    enable = true;

    initExtra = ''
      eval "$(zellij setup --generate-auto-start bash)"
    '';
  };
}
