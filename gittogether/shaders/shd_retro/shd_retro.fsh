/*
	Xor's retro shader.
*/
varying vec4 v_color;
varying vec2 v_coord;

//Pixel width/height.
const vec2 tex = 1./vec2(320,180);
//Scanline intensity.
const float amp = .06;
//Scanline frequency.
const float frq = 160.;

//Screen curvature.
const float cur = .1;
//Screen border width.
const float bor = .2;

void main()
{
	float distort = 1. + cur * (length(v_coord - .5)+bor-.5);
	vec2 coord = (v_coord - .5) * distort + .5;
	
	vec3 line = 1.-amp + amp*cos(coord.x*frq*6.2831+vec3(0,2,4.1));
	float clip = smoothstep(.5+tex.x,.5,abs(coord.x-.5)) * smoothstep(.5+tex.y,.5,abs(coord.y-.5));
	
    gl_FragColor = texture2D(gm_BaseTexture,coord) * vec4(v_color.rgb * clip * line,v_color.a);
}