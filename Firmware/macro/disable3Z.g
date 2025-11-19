; check mode
if global.axisMode = 1
  echo "Switching back to single Z axis"
else
  abort "ERROR: already in single Z axis mode!!"

; move to a known, safe position at the bottom
G90
G1 Z200 U200 V200 F600
G1 X150 Y50 F6000
; cancel the offset allowing for tilting "below 0" (55 mm)
G92 Z145 U145 V145

; switch config
M584 X0.0:0.1 Y0.2:0.3 Z0.5:0.6:0.7 ; z0,z1,z2
M584 P3
M350 X16 Y16 Z16 ; configure microstepping with interpolation
M906 X1700 Y1700 Z1300  ; set axis driver currents
M92 X80 Y80 Z640  ; configure steps per mm
M208 X0:300 Y0:293 Z0:290 ; set minimum and maximum axis limits
M566 X600 Y600 Z50 ; set maximum instantaneous speed changes (mm/min)   ;previous value Z12
M203 X60000 Y60000 Z2100 ;set maximum speeds (mm/min)
M201 X10000 Y10000 Z500  ;set accelerations (mm/s^2)    ;     XY can be set up 40000 without any problems!!    Z1500 on vzbot

; re-home axes
G92 X150 Y50 Z145

; record state
set global.axisMode = 0
