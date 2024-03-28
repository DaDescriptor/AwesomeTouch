extends Control


func update_text(text: String):
	$Label.text = text

func _on_button_pressed():
	DialogManager.push_dialog("Sus", "Is red sus?", {
		"1": "yes", "2": "yes", "3": "yes",
		"4": "no"
	}, update_text)
