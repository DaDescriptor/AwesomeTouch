extends TextEdit
## Purpose: add itself into EditorGlobals.text_edit

func _ready():
	EditorGlobals.text_edit = self
