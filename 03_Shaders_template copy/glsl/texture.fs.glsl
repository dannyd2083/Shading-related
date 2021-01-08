// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader

uniform sampler2D rocksTexture;
varying vec2 texCoord;
void main() {

	// LOOK UP THE COLOR IN THE TEXTURE

  // Set final rendered color according to the surface normal
 vec4 texColor = texture2D(rocksTexture,texCoord);
 gl_FragColor = texColor;
//   gl_FragColor = vec4(1.0,0.0,0.0,1.0); 
 }
