
varying vec3 V_ViewPosition;
varying vec3 V_Normal_VCS;
uniform vec3 lightColor_Uniform;
uniform vec3 ambientColor_Uniform;
uniform vec3 lightPosition_Uniform;
uniform float    kAmbient_Uniform;
uniform float    kDiffuse_Uniform;
uniform float    kSpecular_Uniform;
uniform float    shininess_Uniform;
uniform vec3 baseColor;


void main() {
	// COMPUTE LIGHTING HERE
	vec3 N = normalize(V_Normal_VCS);
	vec3 L = normalize(lightPosition_Uniform - V_ViewPosition);

	float lambertian = max(dot(N, L), 0.0);
	float specular = 0.0;

	vec3 R = reflect(-L,N);
	vec3 V = normalize(-V_ViewPosition);
	float specAngle = max(dot(R, V), 0.0);
    specular = pow(specAngle, shininess_Uniform);

	// vec4();
	gl_FragColor = vec4(baseColor * kAmbient_Uniform * ambientColor_Uniform + 
				kDiffuse_Uniform * lambertian * lightColor_Uniform  + 
				   kSpecular_Uniform * specular * lightColor_Uniform, 1.0);
}