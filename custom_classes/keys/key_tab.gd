class_name TabKey extends Key


func _button_process():
	EditorGlobals.text_edit.insert_text_at_caret("\t", -1)
