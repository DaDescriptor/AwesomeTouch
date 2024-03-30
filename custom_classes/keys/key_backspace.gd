class_name BackspaceKey extends Button


func _gui_event(event):
	if !event is InputEventScreenTouch:
		return # other events don't have .pressed
	if !event.pressed:
		return
		# using this instead of _pressed() allows for multitouch
		# with this the editor experience feels way smoother :)
	
	if EditorGlobals.text_edit.has_selection():
		EditorGlobals.text_edit.delete_selection(-1)
	else:
		EditorGlobals.text_edit.backspace(-1)
