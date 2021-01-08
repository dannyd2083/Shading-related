// The uniform variable is set up in the javascript code and the same for all vertices
uniform vec3 remotePosition;
varying vec3 newRemotePos;

void main() {
	/* HINT: WORK WITH remotePosition HERE! */

    // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position

    newRemotePos = position + remotePosition;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(newRemotePos, 1.0);
}
