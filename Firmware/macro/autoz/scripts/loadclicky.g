
if global.clickystatus != "attached"
 echo "LOADING"
 G90
 M400
 M98 P"/macros/autoz/scripts/clickstage.g"
 M400
 G91
 G1 Y-30 F1500
 G90
 M400
 M98 P"/macros/autoz/scripts/clicky_status.g"
 M400
 if global.clickystatus = "docked"
   echo "Error probe not loaded - aborting"
   abort
 else
   echo "Probe is LOADED"
M400
