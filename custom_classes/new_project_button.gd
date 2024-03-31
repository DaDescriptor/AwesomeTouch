extends Button


var new_project_prefab = preload("res://custom_classes/new_project_dialog.tscn")

func _pressed():
	var new_project_dialog = new_project_prefab.instantiate()
	get_tree().root.add_child(new_project_dialog)
