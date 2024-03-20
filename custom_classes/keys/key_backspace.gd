class_name BackspaceKey extends Button


func _pressed():
	if EditorGlobals.text_edit.has_selection():
		EditorGlobals.text_edit.delete_selection(-1)
	else:
		EditorGlobals.text_edit.backspace(-1)
