extends Node


func _pressed():
	EditorGlobals.text_edit.insert_text_at_caret("\n", -1)
