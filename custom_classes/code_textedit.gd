extends TextEdit
## Purpose: add itself into EditorGlobals.text_edit

func _ready():
	EditorGlobals.text_edit = self
	
	var file_handle: FileAccess = FileAccess.open(EditorGlobals.current_file, FileAccess.READ)
	var file_contents: String = file_handle.get_as_text()
	
	text = file_contents
