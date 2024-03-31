class_name ProjectEntry extends Panel
## An entry in the projects list.


var filemgr_prefab = preload("res://scenes/file_manager.tscn")


func open_project():
	print("opening ", name)
	EditorGlobals.current_project = {
		"name": name,
		"path": EditorGlobals.projects[name]["path"]
	}
	
	var filemgr = filemgr_prefab.instantiate()
	get_tree().root.add_child(filemgr)

func delete_project():
	var handle = FileAccess.open("user://projects", FileAccess.READ)

	var list = handle.get_var()
	handle = null
	handle = FileAccess.open("user://projects", FileAccess.WRITE)
	var i: int = 0
	for entry in list:
		if entry["name"] == name:
			list[i] = null
			break
		i += 1

	handle.store_var(list)
	handle.flush() # write to the disk

	get_tree().root.get_node("Project Picker").load_projects()
