// ELECTRICITY INCLUDE FILE: SAMPLE FILE 1
// ***************************************
// Flicker and roll!
   
   camera {
      location -50*z
      look_at 0
   }
   
   light_source {<1,3,-2>*1000, color 1}
   
   #declare Pole =
   union {
      sphere {+12*y, 2}
      sphere {  0*y, 2}
      sphere {-12*y, 2}
      cylinder {-100*y, 12*y, 1}
      pigment {color rgb 0.8}
      finish {brilliance 2 reflection 0.5}
   }
   
   object {Pole translate -20*x}
   object {Pole translate +20*x}
   
   #include "electric.inc"

// The upper one flickers very much and doesn't roll.
   
   #macro ElectricPath(V) LinearPath( <-20, 12,  0>, < 20, 12,  0>, V ) #end
   #macro ElectricColor(V) <0.4,0.7,1.0> #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.30,     0,        16,          0.5     )
   
   
// The middle one flickers some and rolls some.
   
   #macro ElectricPath(V) LinearPath( <-20,  0,  0>, < 20,  0,  0>, V ) #end
   #macro ElectricColor(V) <0.4,0.7,1.0> #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.30,     5,        10,          0.5     )
   
   
// The lower one rolls a lot and doesn't flicker.
   
   #macro ElectricPath(V) LinearPath( <-20,-12,  0>, < 20,-12,  0>, V ) #end
   #macro ElectricColor(V) <0.4,0.7,1.0> #end
//           Brightness, Thickness, Fuzzyness RollSpeed FlickerSpeed MinDist
   Electric( 0.01,       2,         0.30,     8,        0,           0.5     )
   