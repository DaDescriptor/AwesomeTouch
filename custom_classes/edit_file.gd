extends Button
## Open a FileDialog and load the selected file in the editor.


var editor_prefab = preload("res://scenes/editor.tscn")


func _pressed():
	$FileDialog.visible = true

func _on_file_dialog_file_selected(path):
	EditorGlobals.current_file = path
	
	var editor = editor_prefab.instantiate()
	get_tree().root.add_child(editor)
