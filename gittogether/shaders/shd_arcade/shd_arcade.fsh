/*
	Xor's arcade machine shader.
*/
varying vec4 v_color;
varying vec2 v_coord;
varying vec2 v_position;

//x1,y1,x2,y2 of the screem rectangle.
uniform vec4 rect;
//Animation time in seconds.
uniform float time;

const float spd = 3.;
const float amp = .2;
const float freq = .6;

void main()
{
	
	float line = amp*(.5+.5*cos(v_position.x*6.2831))*(.5+.5*cos(v_position.y*freq-time*spd*freq));
	
	float clip = max(min(v_position.x-rect.x,rect.z-v_position.x),0.)*
	             max(min(rect.w-v_position.y,v_position.y-rect.y),0.);
				 clip = min(clip*.05,1.);
				 
	
    gl_FragColor = texture2D(gm_BaseTexture,v_coord) * vec4(v_color.rgb * (1.+line*clip) ,v_color.a);
}