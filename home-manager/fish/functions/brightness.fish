function brightness --description "Figure out the main display and change the brightness"
  set PRIMARY_DISPLAY (xrandr | awk '/ primary/{print $1}')
  xrandr --output "$PRIMARY_DISPLAY" --brightness $argv[1]
end
