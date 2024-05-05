extends Button
## for your life


static func copy_directory_recursively(p_from : String, p_to : String) -> void:
	if not DirAccess.dir_exists_absolute(p_to):
		DirAccess.make_dir_recursive_absolute(p_to)
	if DirAccess.open(p_from):
		var from = DirAccess.open(p_from)
		from.list_dir_begin()
		var file_name = from.get_next()
		while (file_name != "" && file_name != "." && file_name != ".."):
			if from.current_is_dir():
				copy_directory_recursively(p_from + "/" + file_name, p_to + "/" + file_name)
			else:
				from.copy(p_from + "/" + file_name, p_to + "/" + file_name)
			file_name = from.get_next()
	else:
		push_warning("Error copying " + p_from + " to " + p_to)

func _pressed():
	var operate = true # wait for user to decide
	var cancel = false
	
	if DirAccess.dir_exists_absolute("/storage/emulated/0/lovegame"): # path for love2d game
		operate = false
		var decide = func(opinion):
			if opinion == "overwrite":
				DirAccess.remove_absolute("/storage/emulated/0/lovegame")
			elif opinion == "rename":
				DirAccess.rename_absolute(
					"/storage/emulated/0/lovegame",
					"/storage/emulated/0/lovegame.old"
				)
			else:
				cancel = true
			operate = true
		
		DialogManager.push_dialog("Conflict",
"Directory ~/lovegame already exists.
What should be done?
(renaming will rename existing directory into lovegame.old)",
			{"overwrite": "Overwrite", "rename": "Rename", "cancel": "Cancel"},
			decide
		)
	
	while !operate:
		pass
	
	if !cancel:
		copy_directory_recursively(
			EditorGlobals.current_project["path"],
			"/storage/emulated/0/lovegame"
		)
		OS.execute("/bin/am", ["start", "org.love2d.android"])
