// ELECTRICITY INCLUDE FILE: SAMPLE FILE 1
// ***************************************
// "Mad Scientist"
   
   camera {
      location -50*z
      look_at 0
      rotate 40*sin(clock*2*pi)*y
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
   
   #macro ElectricPath(V) -20*x+40*x*V+12*y +vrotate(-8*x,540*z*V)*sin(V*pi) #end
   #macro ElectricColor(V) #if (mod((V+clock)*20,1)<0.5) 1 #else 0 #end #end
   Electric( 0.015, 2, 0.2, 6, 0, 0.5 )
   
   #macro ElectricPath(V) -20*x+40*x*V +vrotate(3*y,360*x*(4*V+2*clock))*sin(V*pi) #end
   #macro ElectricColor(V) <1.0,0.4,0.7> #end
   Electric( 0.010, 2, 0.2, 6, 10, 0.5 )
   
   #macro ElectricPath(V) LinearPath( <-20,-12,0>, <20,-12,0>, V ) #end
   #macro ElectricColor(V) #if (V<0.5) <1,1,0> #else <0,1,1> #end #end
   Electric( 0.008, 2, 0.5, 0, 16, 0.5 )
   