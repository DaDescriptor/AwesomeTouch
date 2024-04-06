extends Button
## for your life


static func copy_directory_recursively(p_from : String, p_to : String) -> void:
	var directory = DirAccess.new # stupid 5 year old snippeds of code
	if not directory.dir_exists(p_to):
		directory.make_dir_recursive(p_to)
	if directory.open(p_from) == OK:
		directory.list_dir_begin(true)
		var file_name = directory.get_next()
		while (file_name != "" && file_name != "." && file_name != ".."):
			if directory.current_is_dir():
				copy_directory_recursively(p_from + "/" + file_name, p_to + "/" + file_name)
			else:
				directory.copy(p_from + "/" + file_name, p_to + "/" + file_name)
			file_name = directory.get_next()
	else:
		push_warning("Error copying " + p_from + " to " + p_to)

func _pressed():
	var operate = true # wait for user to decide
	var cancel = false
	
	if DirAccess.dir_exists_absolute("/storage/emulated/0/lovegame"): # path for love2d game
		operate = false
		var decide = func(opinion):
			operate = true
			if opinion == "overwrite":
				DirAccess.remove_absolute("/storage/emulated/0/lovegame")
			elif opinion == "rename":
				DirAccess.rename_absolute(
					"/storage/emulated/0/lovegame",
					"/storage/emulated/0/lovegame.old"
				)
			else:
				cancel = true
		
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
		OS.execute("am", ["start", "org.love2d.android"])
