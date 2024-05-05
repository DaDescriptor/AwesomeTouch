class_name ReturnKey extends Key


func _button_process():
	EditorGlobals.text_edit.insert_text_at_caret("\n", -1)
