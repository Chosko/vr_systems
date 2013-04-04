//http://www.unity3dstudent.com/2010/07/beginner-b01-basic-collision-detection/
//script i attach to the moving objects. e.g. the cube, or the spheres.

#pragma strict

function Start () {

}

function Update () {

}

/*
// Collision behaviour. Detects collision with Floor and Wall
//	printing the name of the collider.
function OnCollisionEnter(collision:Collision){
	Debug.Log("collision: "+ collision.gameObject.name +":"+ collision.collider.gameObject.name);
	
	// if the collided object is "Floor"
	if (collision.gameObject.name == "Floor"){
		//printing the name of the collider object
		Debug.Log("Collision with floor by " + collision.collider.gameObject.name, collision.collider.gameObject);
	} else if (collision.gameObject.name == "Wall") {
		Debug.Log("Collision with wall by " + collision.collider.gameObject.name, collision.collider.gameObject);
	}
}
*/