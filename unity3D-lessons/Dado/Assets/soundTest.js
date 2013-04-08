#pragma strict

var myClip : AudioClip;

function Start () {
	AudioSource.PlayClipAtPoint(myClip, transform.position);
}

function Update () {
	
}