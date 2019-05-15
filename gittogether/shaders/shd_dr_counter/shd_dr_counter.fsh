
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 uvs;
uniform float offx;

void main() {
	float uvw = uvs[2] - uvs[0];
	float uvh = uvs[3] - uvs[1];
	float xc  = v_vTexcoord.x + offx;
	if (xc >= uvs[0] && xc <= uvs[2]) {
	    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, vec2(
			xc,
			uvs[1] + ((v_vTexcoord.y - uvs[1] - uvh / 2.) / ((v_vTexcoord.x - uvs[0]) / uvw)) / 2. + (uvh / 2.)
		));
	}
}
