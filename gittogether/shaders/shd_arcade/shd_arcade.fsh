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

//Scan speed.
const float spd = 3.;
//Scan frequency.
const float frq = .6;
//Scanline amplitude.
const float amp = .1;

//Screen glow intensity.
const float glo = .1;
//Glow falloff.
const float fal = .4;

void main()
{
	
	float line = amp*(.5+.5*cos(v_position.x*6.2831))*(.5+.5*cos(v_position.y*frq-time*spd*frq));
	
	float clip = max(min(v_position.x-rect.x,rect.z-v_position.x),0.)*
	             max(min(rect.w-v_position.y,v_position.y-rect.y),0.);
				 clip = min(clip*.05,1.);
	
	float glow = exp(-fal*length(clamp(v_position,rect.xy,rect.zw)-v_position)) *
				 pow(cos(time+v_position.x*.1),2.) * glo * (1.-clip);
	
    gl_FragColor = texture2D(gm_BaseTexture,v_coord) * vec4(v_color.rgb ,v_color.a)-line*clip+glow;
}