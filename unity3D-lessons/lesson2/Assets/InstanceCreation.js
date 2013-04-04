#pragma strict

var model:GameObject;
private var nextGameObjectCreation = 0;
private static var EVENT_RATE = 1;

function Start () {
	//Instantiate a new gameobject		
}

function Update () {
	if (Time.time > nextGameObjectCreation){
		var instance : GameObject = Instantiate(model, transform.position, transform.rotation);
		nextGameObjectCreation = Time.time + EVENT_RATE;
	}
	
}