/*
	logo.pov
	Logo de l'entreprise H4312
*/ 

#include "colors.inc"
#include "textures.inc"
#include "electric/electric.inc"

#declare largura_dente = 0.5;
#declare altura_dente = 0.3;

/*
===============================================================================
Cameras  
===============================================================================
*/
camera {
    location <-2, 0, -5>
    look_at  <0, 0, 5>
    rotate <0, 35, 0>
}


/*
===============================================================================
Lumière
===============================================================================
*/
light_source {
	<3,0,0>
	color White
}

light_source {
	<0,3,0>
	color White
}

/*
===============================================================================
Engrenagem
===============================================================================
*/

#declare Base_Engrenagem = union {
	//Engrenagem
	difference {
	    cylinder {
		    <0,0,5>
		    <0,0,6>
		    2
	    }
	    cylinder {
	        <0,0,4>
	        <0,0,7>
	        1.5
	    }
	}
	//Prisma do raio
	prism {
	    linear_sweep
	    linear_spline
	    -0.5, 
	    0.5, 
	    6, 
	    <-0.4, 0.75>, <-0.10, 0.10>,  <0.05, 0.35>,
	    <0.40, -0.75>, <0.05, -0.05>, <-0.1, -0.30>
		texture {
	        Brass_Metal 
	    }
	    scale <2, 1, 2>
	    rotate <90, 0, -10>
	    translate <0, 0, 5.5>
	  }
}


#declare Dente = box {
    <-altura_dente/2,-largura_dente/2,5>,
    <altura_dente/2,largura_dente/2,6>
    texture {
        New_Brass
    }
    /*texture {
    	Brass_Metal
    }*/
    finish {
        phong 0.5
        reflection 0.2
    }
}

object {
    Base_Engrenagem
    texture {
        New_Brass
    }
    /*texture {
        Brass_Metal
    }*/
    finish {
        phong 0.5
        reflection 0.2
    }
}

//Dentes: 12 dentes posicionados com coordenadas polares
#declare i=0;
#while(i<360)
    object {
        Dente
        rotate <0,0,i>
        translate <-2.1*cos(i*pi/180), -2.1*sin(i*pi/180), 0>
    }
    #declare i=i+30;
#end

/*
===============================================================================
Raios
===============================================================================
*/

//Raio central
#macro ElectricPath(V) 
    LinearPath( 
        <1.5*cos(-pi/6), 1.5*sin(-pi/6),  5.5>, 
        <1.5*cos(5*pi/4), 1.5*sin(5*pi/4), 5.5>, V 
    ) 
#end
#macro ElectricColor(V) <0.4,0.7,1.0> #end
Electric(0.001, 2, 0.30, 0, 16, 0.05)

//Raio mais externo
#macro ElectricPath(V) 
    LinearPath( 
        <1.5*cos(pi/3), 1.5*sin(pi/3),  5>, 
        <1.5*cos(3*pi/4), 1.5*sin(3*pi/4), 5>, V 
    ) 
#end
#macro ElectricColor(V) <0.4,0.7,1.0> #end
Electric(0.001, 2, 0.30, 0, 16, 0.05)

//Raio mais interno
#macro ElectricPath(V) 
    LinearPath( 
        <1.5*cos(0.3), 1.5*sin(0.3),  6>, 
        <1.5*cos(1.01*pi), 1.5*sin(1.01*pi), 6>, V 
    ) 
#end
#macro ElectricColor(V) <0.4,0.7,1.0> #end
Electric(0.001, 2, 0.30, 0, 16, 0.05)
