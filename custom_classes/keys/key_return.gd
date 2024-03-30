class_name ReturnKey extends Button


func _gui_input(event):
	if !(event is InputEventScreenTouch) and !(event is InputEventMouseButton):
		return # other events don't have .pressed
	if !event.pressed:
		return
		# using this instead of _pressed() allows for multitouch
		# with this the editor experience feels way smoother :)
	
	EditorGlobals.text_edit.insert_text_at_caret("\n", -1)
