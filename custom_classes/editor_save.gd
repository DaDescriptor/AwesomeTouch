extends Button


func _pressed():
	var handle = FileAccess.open(EditorGlobals.current_file, FileAccess.WRITE)
	
	var error = FileAccess.get_open_error()
	
	if error != OK:
		print("Writing failed! Error code: ", error)
		DialogManager.push_dialog("Save failed!",
"Error code: [code]%s[/code]
For more info please consult Godot's documentation on Error enum" % error, # user friendly
		{"": "", "close": "Close"},  # "" is an empty button to keep close in the middle
		func(opinion):
			return # your opinion does not matter
			# because there are no buttons doing anything
			# and dialog manager deletes the dialog when a button is pressed
		)
	
	handle.store_string(EditorGlobals.text_edit.text)
	
