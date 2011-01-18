// ELECTRICITY INCLUDE FILE: SAMPLE FILE 1
// ***************************************
// Let the fun begin...
   
   camera {
      location -50*z
      look_at 10*y
   }
   
   light_source {<1,3,-2>*1000, color 1}
   
   #declare Pole =
   union {
      sphere {  0*y, 2}
      cylinder {-20*y, 0, 1}
      pigment {color rgb 0.8}
      finish {brilliance 2 reflection 0.5}
   }
   
   object {Pole translate -20*x}
   object {Pole translate +20*x}
   
   #include "electric.inc"

// The upper one folows a nice circle arc.
   
   #macro ElectricPath(V) vrotate(20*x,180*z*V) #end
   #macro ElectricColor(V) <1.0,1.0,1.0> #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.20,     5,        10,          0.5     )
   
   
// The lower one has nice colors.
   
   #macro ElectricPath(V) LinearPath( <-20,  0,  0>, < 20,  0,  0>, V ) #end
   #macro ElectricColor(V) vaxis_rotate(x,<1,1,1>,(2*V+2*clock)*360) #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.30,     5,        10,          0.5     )
   