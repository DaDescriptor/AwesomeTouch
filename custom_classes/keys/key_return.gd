class_name ReturnKey extends Button


func _gui_event(event):
	if !event is InputEventScreenTouch:
		return # other events don't have .pressed
	if !event.pressed:
		return
		# using this instead of _pressed() allows for multitouch
		# with this the editor experience feels way smoother :)
	
	EditorGlobals.text_edit.insert_text_at_caret("\n", -1)
