#pragma strict

function Start () {

}

function Update () {

}

// destroy the collided object
function OnCollisionEnter(collision:Collision){
	Destroy(collision.gameObject, 2);
}