class_name DialogMgr extends Node
## Dialog thingy.

var button_template = preload("res://custom_classes/dialog_button.tscn")
var dialog_template = preload("res://custom_classes/dialog.tscn")

func push_dialog(
	header: String,
	body: String,
	options: Dictionary,
	selected: Callable
):
	## Create a new dialog box.
	## `selected` will be called when one of the buttons is pressed.
	
	var dialog = dialog_template.instantiate()
	get_tree().root.add_child(dialog) # add dialog to the root
	
	dialog.get_node("VBoxContainer/Header").text = header
	dialog.get_node("VBoxContainer/Body").text = body
	
	for key in options:
		var button = button_template.instantiate()
		button.name = key
		button.text = options[key] # why not just make for loop give key and value?
		
		var return_choice = func():
			# this is called when the button is pressed
			# stupid godot does not allow normal functions
			# inside other functions
			selected.call(key)
			dialog.queue_free()
		
		button.pressed.connect(return_choice)
		
		dialog.get_node("VBoxContainer/Options").add_child(button)
