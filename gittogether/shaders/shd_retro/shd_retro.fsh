/*
	Xor's retro shader.
*/
varying vec4 v_color;
varying vec2 v_coord;

const vec2 texel = 1./vec2(320,180);
const float amp = .06;
const float freq = 160.;
const float curvature = .1;

void main()
{
	float distort = 1. + curvature * length(v_coord - .5);
	vec2 coord = (v_coord - .5) * distort + .5;
	
	vec3 line = 1.-amp + amp*cos(coord.x*freq*6.2831+vec3(0,2,4.1));
	float clip = smoothstep(.5+texel.x,.5,abs(coord.x-.5)) * smoothstep(.5+texel.y,.5,abs(coord.y-.5));
	
    gl_FragColor = texture2D(gm_BaseTexture,coord) * vec4(v_color.rgb * clip * line,v_color.a);
}