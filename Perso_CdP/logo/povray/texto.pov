#include "colors.inc"
#include "textures.inc"

camera {
    location <0, 0, -5>
    look_at  <0, 0, 0>
}

light_source {
	<0, 5, -6>
	color White
}

light_source {
	<0, -5, -6>
	color White
}

/*
===============================================================================
Texto
===============================================================================
*/

text {
	ttf "crystal.ttf" "JEELB" 0.15, 0
	pigment { color rgb <0.192157, 0.498039, 0.796078> }
	scale <2, 2, 2>
	translate <-3, 0, 0>
}