class_name ReturnKey extends Button 


func _pressed():
	EditorGlobals.text_edit.insert_text_at_caret("\n", -1)
