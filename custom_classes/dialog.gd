class_name DialogMgr extends Node
## Dialog thingy.

func push_dialog(header: String, body: String, options: Dictionary) -> String:
	## Create a new dialog box.
	## Will return the pressed button's index.
	## (options = {"y": "Yes", "n": "No"}; user presses Yes; "y" is returned)
	$VBoxContainer/Header.text = header
	$VBoxContainer/Body.text = body
	
	for option in options:
		
