 ; ---------- ---------- Auto Z ---------- ----------

 ; to use autoz, please place the following near the end of your slicers start gcode
 ; M98 P"/macros/autoz/autoz.g" <<< Place in slicer


; ---------- prepare ----------

M98 P"/macros/autoz/scripts/defaults.g" ; load some defaults which will be overwriten by the "edit_me.g"
M98 P"/macros/autoz/edit_me.g" ; load your settings
M98 P"/macros/autoz/scripts/autoz_globals.g" ; load autoz framework

; configure and load the probe

M98 P"/macros/autoz/scripts/use_clicky_autoz.g" ; use the clicky probe
M400
M98 P"/macros/autoz/scripts/clicky_status.g"
M400
M98 P"/macros/autoz/scripts/loadclicky.g" ; pick up and verify clicky
M400

; dock the probe

M98 P"/macros/autoz/scripts/unloadclicky.g" ; pick up and verify clicky
M400
