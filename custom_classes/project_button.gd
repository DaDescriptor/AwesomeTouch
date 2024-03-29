class_name ProjectEntry extends Panel
## An entry in the projects list.


func open_project():
	EditorGlobals.current_project = EditorGlobals.project_list[name]

func delete_project():
	var handle = FileAccess.open("user://projects", FileAccess.READ_WRITE)

	var list = handle.get_var()
	list[name] = null

	handle.store_var(list)
	handle.flush() # write to the disk

	$".".load_projects()
	# "." is the scene root (project picker node)
	# load projects will purge all entries so we don't need to delete the node
