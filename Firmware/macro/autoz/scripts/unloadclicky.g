M98 P"/macros/autoz/scripts/clicky_status.g"
if global.clickystatus != "docked"
 echo "DOCKING"
 G90
 M98 P"/macros/autoz/scripts/clickstage.g"
 M400 ; wait
 G91 ; relative
 G1 X{global.clickywipe} F4000 ; wipe off
 M400
 G90 ; absolute
 M98 P"/macros/autoz/scripts/clicky_status.g"
 M400
 if global.clickystatus = "docked"
  echo "Probe is DOCKED"
 else
  echo "Error probe not docked - aborting"
  abort
