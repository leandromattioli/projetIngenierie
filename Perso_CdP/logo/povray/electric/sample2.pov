// ELECTRICITY INCLUDE FILE: SAMPLE FILE 1
// ***************************************
// Let there be colors!
   
   camera {
      location <0,20,-40>
      look_at -5*y
      rotate 360*clock*y
   }
   
   light_source {<1,3,-2>*1000, color 1}
   
   #declare Pole =
   union {
      sphere {0, 2}
      cylinder {-20*y, 0, 1}
      pigment {color rgb 0.8}
      finish {brilliance 2 reflection 0.5}
   }
   
   object {Pole translate -20*x rotate 000*y}
   object {Pole translate -20*x rotate 120*y}
   object {Pole translate -20*x rotate 240*y}
   
   #include "electric.inc"

// Red to green.
   
   #macro ElectricPath(V) LinearPath( vrotate(-20*x,000*y), vrotate(-20*x,120*y), V ) #end
   #macro ElectricColor(V) LinearColor( <1,0,0>, <0,1,0>, V ) #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.30,     5,        10,          0.5     )
   
   
// Green to blue.
   
   #macro ElectricPath(V) LinearPath( vrotate(-20*x,120*y), vrotate(-20*x,240*y), V ) #end
   #macro ElectricColor(V) LinearColor( <0,1,0>, <0,0,1>, V ) #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.30,     5,        10,          0.5     )
   
   
// Blue to red.
   
   #macro ElectricPath(V) LinearPath( vrotate(-20*x,240*y), vrotate(-20*x,000*y), V ) #end
   #macro ElectricColor(V) LinearColor( <0,0,1>, <1,0,0>, V ) #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.30,     5,        10,           0.5     )
   