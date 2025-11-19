
M574 Z0 C"nil" ; no Z endstop switch, free up Z endstop input may not be needed
M558 P8 C{global.clickypinname} I0 A1 H3 R0.1 F240:120 T9000 S0.0025 
;                                   ^ probe up to 1 time(s)
;G31 P1000 X-1.5 Y38.5 Z4.895 ; Z34.650 for initial nozzle ; configure offsets
G31 P1000 X-1.5 Y38.5 Z5 ; Z34.650 for initial nozzle ; configure offsets
