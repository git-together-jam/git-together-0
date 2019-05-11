/*
	Xor's retro shader.
*/
varying vec4 v_color;
varying vec2 v_coord;

void main()
{
	float distort = .1*(length(v_coord-.5)-sqrt(2.))+1.;
	vec2 coord = (v_coord-.5) * distort+ .5;
	
    gl_FragColor = v_color * texture2D( gm_BaseTexture, coord);
}
