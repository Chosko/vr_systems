public var faceValue = 0;

function OnTriggerEnter(){
	var diceObject = GameObject.Find("Dice");
	var diceValueComponent = diceObject.GetComponent("DiceValue");
	diceValueComponent.currentValue = faceValue;
	var text = GameObject.Find("ResultText");
	//var textGUITextComponent = text.GetComponent("GUIText");
	text.guiText.text = faceValue.ToString();
}
