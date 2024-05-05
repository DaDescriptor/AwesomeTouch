class_name DeselectKey extends Key


func _button_process():
	EditorGlobals.text_edit.deselect(-1)
