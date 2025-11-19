; check mode
if global.axisMode = 0
  echo "Switching to 3 independent Z"
else
  abort "ERROR: already in 3 independent Z mode!!"

; move to a known position
G90
G0 Z40 F500
G0 X150 Y50 F6000

; switch config
; ------------- three Z axes (Z,U,V)
M584 X0.0:0.1 Y0.2:0.3 Z0.5 U0.6 V0.7
M584 P5
M350 X16 Y16 Z16 U16 V16; configure microstepping with interpolation
M906 X1700 Y1700 Z1300 U1300 V1300; set axis driver currents
M92 X80 Y80 Z640 U640 V640 ; configure steps per mm
M208 X0:300 Y0:293 Z0:280 U0:280 V0:280 ; set minimum and maximum axis limits  -----IMPORTANT-----
M566 X600 Y600 Z50 U50 V50 ; set maximum instantaneous speed changes (mm/min)  ; previous value Z12 U12 V12
M203 X60000 Y60000 Z2100 U2100 V2100 ;set maximum speeds (mm/min)
M201 X20000 Y20000 Z500 U500 V500 ;set accelerations (mm/s^2)
M574 U2 P"!e3stop" S1 ; configure fake U axis endstop
M574 V2 P"!e4stop" S1 ; configure fake V axis endstop

; Extruder -- maybe not needed?
M584 E0.4 ; set extruder mapping
M350 E16 I1 ; configure microstepping with interpolation
M906 E700 ; set extruder driver currents
M92  E670.39 ; configure steps per mm
M566 E500 ; set maximum instantaneous speed changes (mm/min)
M203 E5000 ; set maximum speeds (mm/min)
M201 E10000 ; set accelerations (mm/s^2)
;M572 D0 S0.02 ; pressure advance T0
M572 D0 S0.06 ; pressure advance T0 increased value for longer nozzle

; 'home' all axes
G92 X150 Y50 Z40 U40 V40

; add the offset allowing for tilting "below 0" (55 mm for small tilt bed)
;G92 Z95 U95 V95

; add the offset allowing for tilting "below 0" (75 mm for large tilt bed)
G92 Z115 U115 V115

set global.axisMode = 1
