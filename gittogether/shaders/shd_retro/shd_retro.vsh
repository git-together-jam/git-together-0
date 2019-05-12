/*
	Xor's passthrough vertex shader.
*/
attribute vec4 in_Color;  
attribute vec3 in_Position;
attribute vec2 in_Texcoord;

varying vec4 v_color;
varying vec2 v_coord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.);
    
    v_color = in_Color;
    v_coord = in_Texcoord;
}