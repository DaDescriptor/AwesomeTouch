extends Control
## Here be basic FM logic (open files, cd, copy files, rename files, etc.).


var editor_prefab = preload("res://scenes/editor.tscn")


func open_file(file_path: String):
	EditorGlobals.current_file = file_path
	
	var editor = editor_prefab.instantiate()
	get_tree().root.add_child(editor)

func list_dir(dir_path: String):
	
