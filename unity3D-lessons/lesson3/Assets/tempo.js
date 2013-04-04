var temporizza : float = 10.0;

function Update () {
	temporizza -= Time.deltaTime;
	if (temporizza <= 0){
		Debug.Log("Tempo scaduto!");
	}
}